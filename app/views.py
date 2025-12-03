from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth.hashers import check_password, make_password
from .models import User, Role, Module, Course, Enrollment, Assignment, Quiz, AssignmentFile, ModuleContent, Question, Submission, Discussion, Grade, Message
from django.http import JsonResponse
from django.db.models import Max, Count, Avg, Q
from django.utils.dateparse import parse_datetime
from django.utils import timezone
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import get_object_or_404
from django.db import transaction
from django.db.models import Count
from django.contrib.auth.decorators import login_required
from django.views.decorators.http import require_POST
from django.contrib.auth import update_session_auth_hash
from django.core.paginator import Paginator
import json
from urllib.parse import urlparse, parse_qs
from django.core.validators import validate_email
from django.core.exceptions import ValidationError

def login_view(request):
    if request.session.get('user_id'):
        role = request.session.get('role_name')
        if role == 'Dosen':
            return redirect('dosen_dashboard')
        elif role == 'Mahasiswa':
            return redirect('mahasiswa_dashboard')
        elif role == 'Admin': 
            return redirect('admin_dashboard') 

    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')

        try:
            user = User.objects.get(email=email)

            if check_password(password, user.password):
                
                request.session['user_id'] = user.user_id
                request.session['name'] = user.name
                role_name = user.role.role_name if user.role else 'Unknown'
                request.session['role_name'] = role_name

                messages.success(request, f'Selamat datang, {user.name}!')

                if role_name == 'Dosen':
                    return redirect('dosen_dashboard')
                elif role_name == 'Mahasiswa':
                    return redirect('mahasiswa_dashboard')
                elif role_name == 'Admin':
                    return redirect('admin_dashboard')
                else:
                    return redirect('home') 

            else:
                messages.error(request, 'Password salah.')
                
        except User.DoesNotExist:
            messages.error(request, 'Email tidak terdaftar.')

    return render(request, 'login.html')

def logout_view(request):
    try:
        del request.session['user_id']
        del request.session['name']
        del request.session['role_name']
    except KeyError:
        pass
    messages.success(request, 'Anda berhasil logout.')
    return redirect('login_view')


# --- DASHBOARD DOSEN (DIUPDATE) ---

def dosen_dashboard(request):
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        return redirect('login_view')
    
    user_id = request.session['user_id']
    nama_dosen = request.session.get('name', 'Dosen')
    
    # 1. Data Course & Mahasiswa
    courses_qs = Course.objects.filter(lecturer_id=user_id)
    
    # --- LOGIC BARU: Attach mahasiswa ke setiap course ---
    courses_data = []
    for course in courses_qs:
        # Ambil 3 mahasiswa terakhir yang mendaftar
        students = User.objects.filter(
            enrollment__course=course
        ).distinct().order_by('-enrollment__enrolled_at')[:3]
        
        total_enrolled = Enrollment.objects.filter(course=course).count()
        
        courses_data.append({
            'course_id': course.course_id,
            'course_name': course.course_name,
            'students': students,
            'student_count': total_enrolled
        })
    # -----------------------------------------------------

    # 2. Data Modul & Stats Lainnya
    modules = Module.objects.filter(course__in=courses_qs).order_by('-created_at')
    
    # Hitung total unik mahasiswa di semua kelas
    total_students_all = Enrollment.objects.filter(course__in=courses_qs).values('user').distinct().count()
    
    # Ambil beberapa mahasiswa terbaru untuk widget statistik atas
    latest_students = User.objects.filter(
        enrollment__course__in=courses_qs
    ).distinct().order_by('-created_at')[:4]
    
    avg_data = Grade.objects.filter(course__in=courses_qs).aggregate(Avg('score'))
    avg_score = avg_data['score__avg'] or 0
    
    recent_submissions = Submission.objects.filter(
        assignment__module__course__in=courses_qs
    ).select_related('student', 'assignment').order_by('-submitted_at')[:4]

    context = {
        'nama_dosen': nama_dosen,
        'courses': courses_data, # Gunakan data list baru
        'modules': modules,
        'total_courses': courses_qs.count(),
        'total_modules': modules.count(),
        'total_students': total_students_all,
        'latest_students': latest_students,
        'avg_score': round(avg_score, 1),
        'recent_submissions': recent_submissions
    }
    return render(request, 'dosen_dashboard.html', context)

def detail_modul_dosen(request, modul_id):
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        return redirect('login_view')
    
    user_id = request.session['user_id']
    
    try:
        module = get_object_or_404(Module, module_id=modul_id, course__lecturer_id=user_id)
        
        # Ambil contents beserta quiz-nya (prefetch_related agar efisien jika perlu optimization)
        contents = module.contents.all().order_by('order')
        
        # Ambil Tugas yang menempel pada Module ini
        assignments = Assignment.objects.filter(module=module).order_by('deadline')
        
        # Data untuk sidebar (Navigasi modul lain)
        syllabus_modules = Module.objects.filter(course=module.course).order_by('created_at')

    except Exception as e:
        messages.error(request, f"Error: {e}")
        return redirect('dosen_dashboard')
    
    context = {
        'module': module,
        'contents': contents, 
        'assignments': assignments, # Kirim data tugas
        'syllabus_modules': syllabus_modules,
    }
    return render(request, 'modul/detail_modul_dosen.html', context)

def edit_modul(request, modul_id):
    user_id = request.session['user_id']
    module = get_object_or_404(Module, module_id=modul_id, course__lecturer_id=user_id)

    if request.method == 'POST':
        module.title = request.POST.get('title', module.title)
        module.description = request.POST.get('description', module.description)
        module.save()
        
        if request.headers.get('x-requested-with') == 'XMLHttpRequest':
             return JsonResponse({'status': 'success', 'new_title': module.title, 'new_description': module.description})
        
        return redirect('detail_modul_dosen', modul_id=module.module_id)
    
    return redirect('detail_modul_dosen', modul_id=module.module_id)

def tambah_modul(request):
    # Digunakan jika akses langsung lewat url, atau bisa diarahkan dari edit_course
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        return redirect('login_view')

    user_id = request.session['user_id']
    
    # Jika ada parameter course_id di URL (misal: /modul/tambah/?course_id=5)
    initial_course_id = request.GET.get('course_id')
    dosen_courses = Course.objects.filter(lecturer_id=user_id)

    if request.method == 'POST':
        title = request.POST.get('title')
        description = request.POST.get('description') 
        course_id = request.POST.get('course')

        try:
            course = get_object_or_404(Course, course_id=course_id, lecturer_id=user_id)
            module = Module.objects.create(title=title, description=description, course=course)
            messages.success(request, f"Modul berhasil ditambahkan.")
            # Redirect kembali ke edit course parent-nya
            return redirect('edit_course', course_id=course.course_id)

        except Exception as e:
            messages.error(request, f"Error: {e}")

    context = {
        'dosen_courses': dosen_courses,
        'selected_course_id': int(initial_course_id) if initial_course_id else None
    }
    return render(request, 'modul/form_modul.html', context)

def hapus_modul(request, modul_id):
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        return redirect('login_view')

    user_id = request.session['user_id']

    if request.method == 'POST':
        try:
            module = get_object_or_404(Module, module_id=modul_id, course__lecturer_id=user_id)
            course_id = module.course.course_id # Simpan ID course sebelum dihapus
            module.delete()
            messages.success(request, "Modul berhasil dihapus.")
            
            # REVISI: Redirect kembali ke halaman Edit Course, bukan Dashboard
            return redirect('edit_course', course_id=course_id)
            
        except Exception as e:
            messages.error(request, f"Error: {e}")
            return redirect('dosen_dashboard')

    return redirect('dosen_dashboard')

def mahasiswa_dashboard(request):
    if not request.session.get('user_id') or request.session.get('role_name') != 'Mahasiswa':
        return redirect('login_view')
    
    user_id = request.session['user_id']
    nama_mahasiswa = request.session.get('name', 'Mahasiswa')
    
    # --- 1. STATISTIK BELAJAR & ACTIVE COURSES ---
    enrollments = Enrollment.objects.filter(user_id=user_id).select_related('course', 'last_module')
    enrolled_course_ids = list(enrollments.values_list('course_id', flat=True))
    
    total_modules_done_all = 0
    active_courses = []

    for enroll in enrollments:
        # Hitung Progress Per Course
        course_modules = Module.objects.filter(course=enroll.course).order_by('created_at')
        mod_ids = list(course_modules.values_list('module_id', flat=True))
        total_mods = len(mod_ids)
        
        completed_count = 0
        resume_id = None
        
        if enroll.last_module and enroll.last_module.module_id in mod_ids:
            current_index = mod_ids.index(enroll.last_module.module_id)
            completed_count = current_index + 1
            resume_id = enroll.last_module.module_id
        elif total_mods > 0:
            resume_id = mod_ids[0]

        progress = int((completed_count / total_mods) * 100) if total_mods > 0 else 0
        total_modules_done_all += completed_count

        # Masukkan ke list Active Courses (Jika belum 100%)
        if progress < 100:
            active_courses.append({
                'course': enroll.course,
                'total_modules': total_mods,
                'first_module_id': resume_id,
                'progress_percent': progress,
                'completed_count': completed_count
            })

    # Limit active courses di dashboard cuma 2 agar rapi
    active_courses = active_courses[:2]

    # --- 2. AVAILABLE COURSES (PAGINATION FIX: 6 ITEM) ---
    search_query = request.GET.get('q', '').lower()
    sort_option = request.GET.get('sort', 'newest')
    
    # Base Query: Exclude yang sudah di-enroll
    available_courses_qs = Course.objects.exclude(course_id__in=enrolled_course_ids).select_related('lecturer')

    # Filter Search
    if search_query:
        available_courses_qs = available_courses_qs.filter(
            Q(course_name__icontains=search_query) | 
            Q(description__icontains=search_query)
        )
    
    # Sort
    if sort_option == 'a-z':
        available_courses_qs = available_courses_qs.order_by('course_name')
    elif sort_option == 'z-a': # Typo fix: z-a logic
        available_courses_qs = available_courses_qs.order_by('-course_name')
    elif sort_option == 'oldest':
        available_courses_qs = available_courses_qs.order_by('created_at')
    else: # newest
        available_courses_qs = available_courses_qs.order_by('-created_at')

    # PAGINATION: 6 item per halaman (2 baris x 3 kolom)
    paginator = Paginator(available_courses_qs, 6)
    page_number = request.GET.get('page', 1)
    page_obj = paginator.get_page(page_number)

    # --- 3. DATA STATISTIK LAINNYA ---
    assignments_done = Submission.objects.filter(student_id=user_id).count()
    avg_data = Grade.objects.filter(user_id=user_id).aggregate(Avg('score'))
    avg_score = avg_data['score__avg'] or 0 
    discussion_count = Discussion.objects.filter(user_id=user_id).count()
    total_points = (assignments_done * 50) + (total_modules_done_all * 10) + (discussion_count * 5)

    # Pending Tasks
    all_assignments = Assignment.objects.filter(
        module__course__course_id__in=enrolled_course_ids
    ).order_by('deadline')
    
    pending_tasks = []
    for a in all_assignments:
        if not Submission.objects.filter(assignment=a, student_id=user_id).exists():
            pending_tasks.append(a)
            if len(pending_tasks) >= 3: break 

    recent_discussions = Discussion.objects.filter(
        course_id__in=enrolled_course_ids
    ).select_related('user', 'course').order_by('-created_at')[:4]

    context = {
        'nama_mahasiswa': nama_mahasiswa,
        'active_courses': active_courses,
        'available_courses': page_obj, # Gunakan Page Object
        'search_query': search_query,
        'sort_option': sort_option,
        'stats': {
            'modules_done': total_modules_done_all,
            'assignments_done': assignments_done,
            'avg_score': round(avg_score, 1),
            'points': total_points,
            'courses_count': len(enrolled_course_ids)
        },
        'pending_tasks': pending_tasks,
        'recent_discussions': recent_discussions,
    }

    # Jika request AJAX (untuk filter/pagination dashboard), render partial
    if request.headers.get('x-requested-with') == 'XMLHttpRequest':
        return render(request, 'components/dashboard_content.html', context)

    return render(request, 'mahasiswa_dashboard.html', context)

# --- 2. NEW: COURSE DETAIL VIEW ---
def course_detail(request, course_id):
    # Check if user is logged in (Optional, depending on if this is public)
    user_id = request.session.get('user_id')
    role_name = request.session.get('role_name')

    course = get_object_or_404(Course, course_id=course_id)
    modules = Module.objects.filter(course=course).order_by('created_at')
    
    is_enrolled = False
    resume_module_id = None

    if user_id and role_name == 'Mahasiswa':
        enrollment = Enrollment.objects.filter(user_id=user_id, course=course).first()
        if enrollment:
            is_enrolled = True
            # Determine where to resume
            if enrollment.last_module:
                resume_module_id = enrollment.last_module.module_id
            elif modules.exists():
                resume_module_id = modules.first().module_id

    context = {
        'course': course,
        'modules': modules,
        'is_enrolled': is_enrolled,
        'resume_module_id': resume_module_id,
        'lecturer_name': course.lecturer.name if course.lecturer else "Tim Pengajar"
    }
    return render(request, 'course_detail.html', context)

# --- 3. NEW: ENROLL ACTION ---
def enroll_course(request, course_id):
    if not request.session.get('user_id') or request.session.get('role_name') != 'Mahasiswa':
        messages.error(request, "Silakan login sebagai mahasiswa untuk mendaftar.")
        return redirect('login_view')

    user_id = request.session['user_id']
    course = get_object_or_404(Course, course_id=course_id)

    # Create enrollment if not exists
    obj, created = Enrollment.objects.get_or_create(user_id=user_id, course=course)
    
    if created:
        messages.success(request, f"Berhasil mendaftar di kelas {course.course_name}!")
    else:
        messages.info(request, f"Anda sudah terdaftar di kelas ini.")

    return redirect('course_detail', course_id=course_id)

# --- 4. UPDATE: DETAIL MODUL (Track Progress) ---
def detail_modul(request, modul_id):
    # 1. Authentication & Authorization
    if not request.session.get('user_id') or request.session.get('role_name') != 'Mahasiswa':
        return redirect('login_view')
        
    user_id = request.session['user_id']
    
    # 2. Get Current Module & Content
    module = get_object_or_404(Module, module_id=modul_id)
    
    # 3. Enrollment Check & Update Last Access
    enrollment = Enrollment.objects.filter(user_id=user_id, course=module.course).first()
    if not enrollment:
        messages.error(request, "Anda belum terdaftar di kelas ini.")
        return redirect('mahasiswa_dashboard')

    enrollment.last_module = module
    enrollment.save()

    # 4. Fetch Content (Video/Text)
    # We take the first content item for the main player, or iterate in template
    contents = ModuleContent.objects.filter(module=module).order_by('order')
    main_content = contents.first() 

    # 5. Syllabus Navigation (All modules in course)
    course_modules = Module.objects.filter(course=module.course).order_by('created_at')
    
    # Logic for Next/Prev buttons
    module_list = list(course_modules)
    try:
        current_index = module_list.index(module)
        prev_module = module_list[current_index - 1] if current_index > 0 else None
        next_module = module_list[current_index + 1] if current_index < len(module_list) - 1 else None
    except ValueError:
        prev_module = None
        next_module = None

    # 6. Assignments & Submission Logic
    assignment = Assignment.objects.filter(module=module).first() # Assuming 1 assignment per module
    submission = None
    grade = None
    
    if assignment:
        submission = Submission.objects.filter(assignment=assignment, student_id=user_id).first()

        grade = Grade.objects.filter(assignment=assignment, user_id=user_id).first()

        # Handle POST: Upload Submission
        if request.method == 'POST' and not submission:
            answer_text = request.POST.get('answer_text')
            # Handle single file upload logic here (simplified)
            uploaded_file = request.FILES.get('assignment_file')
            
            file_url = ''
            if uploaded_file:
                # In real app: save file to media and get path. 
                # For demo, we just store the name or handle standard FileSystemStorage
                # This requires FileSystemStorage setup, here we just mock the path save
                from django.core.files.storage import FileSystemStorage
                fs = FileSystemStorage()
                filename = fs.save(f"assignments/{uploaded_file.name}", uploaded_file)
                file_url = fs.url(filename)

            Submission.objects.create(
                assignment=assignment,
                student_id=user_id,
                answer_text=answer_text,
                file_url=file_url
            )
            messages.success(request, "Tugas berhasil dikumpulkan!")
            return redirect('detail_modul', modul_id=modul_id)

    # 7. Context Assembly
    context = {
        'module': module,
        'main_content': main_content, 
        'contents': contents,
        'course_modules': course_modules,
        'prev_module': prev_module,
        'next_module': next_module,
        'assignment': assignment,
        'submission': submission,
        'grade': grade,
    }

    return render(request, 'modul/detail_modul.html', context)

def list_modul(request):
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        return redirect('login_view')
    
    user_id = request.session['user_id']
    dosen_courses = Course.objects.filter(lecturer_id=user_id)
    
    # 1. Base Query
    modules_qs = Module.objects.filter(course__in=dosen_courses).select_related('course')

    # 2. Search Logic
    search_query = request.GET.get('q', '')
    if search_query:
        modules_qs = modules_qs.filter(title__icontains=search_query)

    # 3. Sort Logic
    sort_option = request.GET.get('sort', 'newest')
    if sort_option == 'a-z':
        modules_qs = modules_qs.order_by('title')
    elif sort_option == 'z-a':
        modules_qs = modules_qs.order_by('-title')
    elif sort_option == 'oldest':
        modules_qs = modules_qs.order_by('created_at')
    else: # newest (default)
        modules_qs = modules_qs.order_by('-created_at')

    # 4. Pagination (10 item per halaman)
    paginator = Paginator(modules_qs, 10)
    page_number = request.GET.get('page', 1)
    page_obj = paginator.get_page(page_number)

    context = {
        'modules': page_obj,
        'search_query': search_query,
        'sort_option': sort_option
    }

    # 5. AJAX Handling: Jika request dari JS, render hanya potongan tabelnya saja
    if request.headers.get('x-requested-with') == 'XMLHttpRequest':
        return render(request, 'components/modul_list_content.html', context)

    return render(request, 'modul/list_modul.html', context)

# --- 3. FUNGSI BARU: CRUD KONTEN (HALAMAN) ---

# Helper kecil untuk convert URL Youtube (copas dari logic Model biar konsisten)
def get_embed_url_helper(url):
    if not url: return ""
    url = url.strip()
    
    # Tambahkan https jika lupa
    if not url.startswith(('http://', 'https://')):
        url = 'https://' + url
        
    try:
        parsed = urlparse(url)
        if 'youtube' in parsed.netloc or 'youtu.be' in parsed.netloc:
            video_id = None
            if 'youtu.be' in parsed.netloc:
                video_id = parsed.path.lstrip('/')
            elif 'youtube.com' in parsed.netloc:
                if '/watch' in parsed.path:
                    video_id = parse_qs(parsed.query).get('v', [None])[0]
                elif '/embed/' in parsed.path:
                    video_id = parsed.path.split('/')[-1]
                elif '/shorts/' in parsed.path:
                    video_id = parsed.path.split('/')[-1]
            
            if video_id:
                clean_id = video_id.split('&')[0].split('?')[0]
                return f"https://www.youtube.com/embed/{clean_id}"
    except:
        pass
            
    return url

# 1. CREATE CONTENT AJAX
def create_content_ajax(request):
    if request.method == 'POST':
        try:
            module_id = request.POST.get('module_id')
            title = request.POST.get('title')
            text_content = request.POST.get('text_content')
            video_url = request.POST.get('video_url')

            module = Module.objects.get(module_id=module_id)
            
            # Hitung urutan terakhir
            last_order = ModuleContent.objects.filter(module=module).count() + 1

            content = ModuleContent.objects.create(
                module=module,
                title=title,
                text_content=text_content,
                video_url=video_url,
                order=last_order
            )
            
            return JsonResponse({
                'status': 'success',
                'message': 'Materi berhasil ditambahkan',
                'content_id': content.content_id,
                'title': content.title,
                'text_content': content.text_content,
                'video_url': content.video_url,
                'embed_url': get_embed_url_helper(content.video_url) # Kirim link embed siap pakai
            })
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
    return JsonResponse({'status': 'error'})

# 2. UPDATE CONTENT AJAX
def update_content_ajax(request):
    if request.method == 'POST':
        try:
            content_id = request.POST.get('content_id') # ID materi yg diedit
            title = request.POST.get('title')
            text_content = request.POST.get('text_content')
            video_url = request.POST.get('video_url')

            content = get_object_or_404(ModuleContent, content_id=content_id)
            content.title = title
            content.text_content = text_content
            content.video_url = video_url
            content.save()

            return JsonResponse({
                'status': 'success',
                'message': 'Materi berhasil diperbarui',
                'content_id': content.content_id,
                'title': content.title,
                'text_content': content.text_content,
                'video_url': content.video_url,
                'embed_url': get_embed_url_helper(content.video_url)
            })
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
    return JsonResponse({'status': 'error'})

# 2. FUNGSI BARU: REORDER DRAG & DROP (AJAX)
@csrf_exempt
def reorder_konten(request):
    """Menerima list ID dalam urutan baru dan mengupdate database"""
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        return JsonResponse({'status': 'error', 'message': 'Unauthorized'}, status=403)

    if request.method == 'POST':
        try:
            # Ambil data JSON dari body request
            data = json.loads(request.body)
            ordered_ids = data.get('ordered_ids', [])

            if not ordered_ids:
                return JsonResponse({'status': 'error', 'message': 'Data urutan kosong'})

            # Gunakan transaction atomic agar aman
            with transaction.atomic():
                # Update urutan setiap item berdasarkan index di list
                for index, content_id in enumerate(ordered_ids):
                    # Validasi kepemilikan (agar tidak bisa ubah konten orang lain)
                    # order dimulai dari 1 (index + 1)
                    ModuleContent.objects.filter(
                        content_id=content_id, 
                        module__course__lecturer_id=request.session['user_id']
                    ).update(order=index + 1)
            
            return JsonResponse({'status': 'success', 'message': 'Urutan tersimpan'})

        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

    return JsonResponse({'status': 'error', 'message': 'Invalid method'}, status=400)

def hapus_konten(request, content_id):
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        if request.headers.get('x-requested-with') == 'XMLHttpRequest':
             return JsonResponse({'status': 'error', 'message': 'Unauthorized'}, status=403)
        return redirect('login_view')

    if request.method == 'POST':
        content = get_object_or_404(ModuleContent, content_id=content_id, module__course__lecturer_id=request.session['user_id'])
        modul_id = content.module.module_id
        content.delete()

        if request.headers.get('x-requested-with') == 'XMLHttpRequest':
            return JsonResponse({'status': 'success', 'message': 'Konten berhasil dihapus'})

        messages.success(request, "Halaman materi dihapus.")
        return redirect('detail_modul_dosen', modul_id=modul_id)
    
    return redirect('dosen_dashboard')

@transaction.atomic
def create_quiz_ajax(request):
    if request.method == 'POST':
        try:
            # ... (Kode pengambilan data sama seperti sebelumnya) ...
            content_id = request.POST.get('content_id')
            title = request.POST.get('title')
            description = request.POST.get('description')
            content = ModuleContent.objects.get(content_id=content_id)

            # Buat Quiz
            quiz = Quiz.objects.create(content=content, title=title, description=description)

            # Simpan Soal (Looping sama seperti sebelumnya)
            questions_text = request.POST.getlist('q_text[]')
            opts_a = request.POST.getlist('opt_a[]')
            opts_b = request.POST.getlist('opt_b[]')
            opts_c = request.POST.getlist('opt_c[]')
            opts_d = request.POST.getlist('opt_d[]')
            corrects = request.POST.getlist('correct_answer[]')

            for i in range(len(questions_text)):
                Question.objects.create(
                    quiz=quiz,
                    question_text=questions_text[i],
                    option_a=opts_a[i],
                    option_b=opts_b[i],
                    option_c=opts_c[i],
                    option_d=opts_d[i],
                    correct_answer=corrects[i]
                )

            return JsonResponse({
                'status': 'success', 
                'message': 'Quiz berhasil dibuat!',
                'quiz_id': quiz.quiz_id,          
                'quiz_title': quiz.title,
                'question_count': len(questions_text)
            })
    
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
    return JsonResponse({'status': 'error', 'message': 'Invalid request'})

def get_quiz_data(request, quiz_id):
    try:
        quiz = Quiz.objects.get(quiz_id=quiz_id)
        questions = quiz.questions.all()
        
        # Susun data dalam list dictionary
        questions_data = []
        for q in questions:
            questions_data.append({
                'text': q.question_text,
                'a': q.option_a,
                'b': q.option_b,
                'c': q.option_c,
                'd': q.option_d,
                'correct': q.correct_answer
            })
            
        data = {
            'status': 'success',
            'quiz_id': quiz.quiz_id,
            'title': quiz.title,
            'description': quiz.description,
            'questions': questions_data
        }
        return JsonResponse(data)
    except Quiz.DoesNotExist:
        return JsonResponse({'status': 'error', 'message': 'Quiz not found'})

# 2. API untuk menyimpan perubahan (Update)
def update_quiz_ajax(request):
    if request.method == 'POST':
        try:
            quiz_id = request.POST.get('quiz_id') # ID Quiz yang diedit
            title = request.POST.get('title')
            description = request.POST.get('description')
            
            # A. Update Data Utama Quiz
            quiz = get_object_or_404(Quiz, quiz_id=quiz_id)
            quiz.title = title
            quiz.description = description
            quiz.save()
            
            # B. Update Soal (Strategi: Hapus semua soal lama, ganti dengan yang baru dari form)
            # Ini cara paling aman untuk menangani urutan berubah, soal dihapus, atau soal ditambah.
            quiz.questions.all().delete()

            # C. Buat Soal Baru (Sama seperti logic Create)
            questions_text = request.POST.getlist('q_text[]')
            opts_a = request.POST.getlist('opt_a[]')
            opts_b = request.POST.getlist('opt_b[]')
            opts_c = request.POST.getlist('opt_c[]')
            opts_d = request.POST.getlist('opt_d[]')
            corrects = request.POST.getlist('correct_answer[]')

            for i in range(len(questions_text)):
                Question.objects.create(
                    quiz=quiz,
                    question_text=questions_text[i],
                    option_a=opts_a[i],
                    option_b=opts_b[i],
                    option_c=opts_c[i],
                    option_d=opts_d[i],
                    correct_answer=corrects[i]
                )

            return JsonResponse({'status': 'success', 'message': 'Quiz berhasil diperbarui!'})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
    return JsonResponse({'status': 'error'})

def hapus_quiz(request, quiz_id):
    # Hanya terima POST method untuk keamanan
    if request.method == 'POST':
        try:
            quiz = get_object_or_404(Quiz, quiz_id=quiz_id)
            content_id = quiz.content.content_id # Simpan ID konten untuk update UI
            
            # Hapus Quiz (Question otomatis terhapus karena on_delete=models.CASCADE)
            quiz.delete()

            # Cek apakah request ini dari AJAX (JavaScript)
            if request.headers.get('x-requested-with') == 'XMLHttpRequest':
                return JsonResponse({
                    'status': 'success', 
                    'message': 'Quiz berhasil dihapus',
                    'content_id': content_id
                })
            
            # Fallback untuk non-AJAX
            messages.success(request, "Quiz berhasil dihapus.")
            return redirect('detail_modul_dosen', modul_id=quiz.content.module.module_id)

        except Exception as e:
            if request.headers.get('x-requested-with') == 'XMLHttpRequest':
                return JsonResponse({'status': 'error', 'message': str(e)}, status=500)
            messages.error(request, f"Error: {e}")
    
    return redirect('dosen_dashboard')

# --- UPDATE LOGIC BUAT TUGAS ---
def create_task_ajax(request):
    if request.method == 'POST':
        try:
            module_id = request.POST.get('module_id')
            title = request.POST.get('title')
            description = request.POST.get('description')
            
            # --- PERBAIKAN DI SINI ---
            deadline_str = request.POST.get('deadline') 
            # Ubah String '2025-11-21T14:00' menjadi Object Datetime Python
            deadline_obj = parse_datetime(deadline_str) 

            module = Module.objects.get(module_id=module_id)
            
            # Gunakan object datetime yang sudah dikonversi
            assign = Assignment.objects.create(
                module=module,
                title=title,
                description=description,
                deadline=deadline_obj 
            )

            # Handle File Uploads (Multiple)
            files = request.FILES.getlist('files')
            for f in files:
                AssignmentFile.objects.create(assignment=assign, file=f)

            return JsonResponse({
                'status': 'success', 
                'new_task_title': assign.title,
                'new_task_deadline': assign.deadline.strftime("%d %b %H:%M"),
                'task_id': assign.assignment_id  # <--- TAMBAHKAN INI
            })
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
            
    return JsonResponse({'status': 'error', 'message': 'Invalid method'})

def get_task_data(request, assignment_id):
    try:
        task = Assignment.objects.get(assignment_id=assignment_id)
        # Format tanggal harus 'YYYY-MM-DDTHH:MM' agar bisa masuk ke input type="datetime-local"
        deadline_str = task.deadline.strftime('%Y-%m-%dT%H:%M') if task.deadline else ''
        
        data = {
            'status': 'success',
            'task_id': task.assignment_id,
            'title': task.title,
            'description': task.description,
            'deadline': deadline_str
        }
        return JsonResponse(data)
    except Assignment.DoesNotExist:
        return JsonResponse({'status': 'error', 'message': 'Tugas tidak ditemukan'})

# 2. UPDATE TUGAS (AJAX)
def update_task_ajax(request):
    if request.method == 'POST':
        try:
            task_id = request.POST.get('task_id')
            title = request.POST.get('title')
            description = request.POST.get('description')
            deadline_str = request.POST.get('deadline')
            
            task = get_object_or_404(Assignment, assignment_id=task_id)
            task.title = title
            task.description = description
            
            if deadline_str:
                task.deadline = parse_datetime(deadline_str)
            
            task.save()

            # Opsional: Tambah file baru jika user upload file tambahan saat edit
            files = request.FILES.getlist('files')
            for f in files:
                AssignmentFile.objects.create(assignment=task, file=f)

            return JsonResponse({
                'status': 'success', 
                'message': 'Tugas berhasil diperbarui',
                'task_id': task.assignment_id,
                'title': task.title,
                'deadline': task.deadline.strftime("%d %b %H:%M")
            })
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
    return JsonResponse({'status': 'error'})

# 3. DELETE TUGAS (AJAX)
def delete_task_ajax(request, assignment_id):
    if request.method == 'POST':
        try:
            task = get_object_or_404(Assignment, assignment_id=assignment_id)
            task.delete()
            return JsonResponse({'status': 'success', 'message': 'Tugas berhasil dihapus'})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
    return JsonResponse({'status': 'error'})

def geser_konten_ajax(request, content_id, arah):
    # 1. Proteksi
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        return JsonResponse({'status': 'error', 'message': 'Unauthorized'}, status=403)

    if request.method == 'POST':
        try:
            # 2. Ambil Konten yang mau digeser
            konten_ini = ModuleContent.objects.get(
                content_id=content_id, 
                module__course__lecturer_id=request.session['user_id']
            )
            
            # 3. Cari Tetangga (Target Tukar)
            konten_tukar = None
            if arah == 'up':
                # Cari yang order-nya lebih KECIL (di atasnya) tapi yang paling dekat (last)
                konten_tukar = ModuleContent.objects.filter(
                    module=konten_ini.module, 
                    order__lt=konten_ini.order
                ).order_by('order').last()
            elif arah == 'down':
                # Cari yang order-nya lebih BESAR (di bawahnya) tapi yang paling dekat (first)
                konten_tukar = ModuleContent.objects.filter(
                    module=konten_ini.module, 
                    order__gt=konten_ini.order
                ).order_by('order').first()

            # 4. Lakukan Pertukaran (Swap)
            if konten_tukar:
                with transaction.atomic():
                    # Tukar nilai order
                    prev_order = konten_ini.order
                    konten_ini.order = konten_tukar.order
                    konten_tukar.order = prev_order
                    
                    konten_ini.save()
                    konten_tukar.save()
                    
                return JsonResponse({'status': 'success', 'message': 'Posisi berhasil ditukar'})
            else:
                return JsonResponse({'status': 'warning', 'message': 'Sudah di posisi ujung'})

        except ModuleContent.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': 'Konten tidak ditemukan'}, status=404)
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

    return JsonResponse({'status': 'error', 'message': 'Invalid request'}, status=400)

def content_detail_api(request, content_id):
    content = get_object_or_404(ModuleContent, pk=content_id)

    # 1. Logika Video URL (Sama seperti sebelumnya)
    video_url = None
    if hasattr(content, 'get_embed_url') and callable(getattr(content, 'get_embed_url')):
        video_url = content.get_embed_url()
    elif content.video_url:
        video_url = content.video_url

    # 2. LOGIKA BARU: DATA QUIZ
    quiz_data = None
    # Cek apakah konten ini punya kuis (menggunakan related_name 'quiz' dari OneToOneField)
    if hasattr(content, 'quiz'):
        quiz = content.quiz
        user_id = request.session.get('user_id')
        
        # Cek apakah user sudah mengerjakan?
        existing_grade = Grade.objects.filter(user_id=user_id, quiz=quiz).first()
        
        questions_list = []
        # Jika belum dikerjakan, kirim daftar soal
        if not existing_grade:
            for q in quiz.questions.all():
                questions_list.append({
                    'id': q.question_id,
                    'text': q.question_text,
                    'options': [
                        {'key': 'A', 'val': q.option_a},
                        {'key': 'B', 'val': q.option_b},
                        {'key': 'C', 'val': q.option_c},
                        {'key': 'D', 'val': q.option_d},
                    ]
                })
        
        quiz_data = {
            'id': quiz.quiz_id,
            'title': quiz.title,
            'description': quiz.description,
            'is_completed': existing_grade is not None,
            'score': existing_grade.score if existing_grade else 0,
            'questions': questions_list
        }

    # 3. Susun Response Akhir
    data = {
        'status': 'success',
        'id': content.content_id,
        'title': content.title,
        'text_content': content.text_content,
        'video_url': video_url,
        'type': 'video' if video_url else 'text',
        'quiz': quiz_data 
    }
    return JsonResponse(data)

def signup_view(request):
    if request.method == 'POST':
        # 1. Ambil input
        nama = request.POST.get('username')
        email = request.POST.get('email')
        password = request.POST.get('password')
        confirm_password = request.POST.get('confirm_password')
        role_input = request.POST.get('role')

        # 2. Validasi Password
        if password != confirm_password:
            messages.error(request, 'Password dan konfirmasi password tidak sama.')
            return render(request, 'signup.html')

        # 3. Validasi Duplikat
        # Cek apakah nama sudah dipakai (pastikan field di User adalah 'name' sesuai error sebelumnya)
        if User.objects.filter(name=nama).exists():
            messages.error(request, 'Nama pengguna ini sudah digunakan.')
            return render(request, 'signup.html')
        
        if User.objects.filter(email=email).exists():
            messages.error(request, 'Email ini sudah terdaftar sebelumnya.')
            return render(request, 'signup.html')

        # 4. Proses Simpan
        try:
            # --- PERBAIKAN DI SINI ---
            # Error log bilang field-nya 'role_name', bukan 'name'
            try:
                role_instance = Role.objects.get(role_name=role_input)
            except Role.DoesNotExist:
                # Pesan error jika role 'mahasiswa' atau 'dosen' belum ada di database
                messages.error(request, f'Peran "{role_input}" belum tersedia di database.')
                return render(request, 'signup.html')

            # Simpan User
            User.objects.create(
                name=nama,
                email=email,
                password=make_password(password),
                role=role_instance  # Masukkan objek role yang ditemukan
            )

            messages.success(request, 'Pendaftaran berhasil! Silakan masuk dengan akun baru Anda.')
            return redirect('login_view')

        except Exception as e:
            # Print error asli ke terminal untuk Anda (developer)
            print(f"System Error: {e}") 
            
            # Tampilkan pesan error yang sedikit lebih detail ke user (tapi tidak terlalu teknis)
            # Pesan ini akan muncul jika ada masalah database lain (misal koneksi putus)
            messages.error(request, 'Gagal menyimpan data. Pastikan semua kolom terisi dengan benar.')
            return render(request, 'signup.html')

    return render(request, 'signup.html')

def my_learning(request):
    # 1. Cek Login
    if not request.session.get('user_id'):
        return redirect('login_view')

    user_id = request.session['user_id']
    
    # 2. Ambil Parameter Filter dari URL
    search_query = request.GET.get('q', '').lower()
    sort_option = request.GET.get('sort', 'newest')
    filter_status = request.GET.get('filter', 'all')
    
    # 3. Query Dasar (Optimized dengan select_related)
    enrollments_qs = Enrollment.objects.filter(user_id=user_id).select_related('course', 'course__lecturer', 'last_module')
    
    final_list = []
    
    # 4. Processing Data (Hitung Progress & Filter Manual)
    for enroll in enrollments_qs:
        # A. Filter Pencarian (Nama Kursus atau Deskripsi)
        c_name = enroll.course.course_name.lower()
        c_desc = (enroll.course.description or '').lower()
        
        if search_query and (search_query not in c_name) and (search_query not in c_desc):
            continue # Skip jika tidak cocok search

        # B. Hitung Progress
        # Ambil semua ID modul dalam kursus ini secara berurutan
        mod_ids = list(Module.objects.filter(course=enroll.course).order_by('created_at').values_list('module_id', flat=True))
        total = len(mod_ids)
        
        completed = 0
        resume_id = None
        
        if total > 0:
            # Tentukan posisi terakhir
            if enroll.last_module_id and enroll.last_module_id in mod_ids:
                completed = mod_ids.index(enroll.last_module_id) + 1
                resume_id = enroll.last_module_id
            else:
                # Jika belum mulai, arahkan ke modul pertama
                resume_id = mod_ids[0]
        
        pct = int((completed / total) * 100) if total > 0 else 0

        # C. Filter Status (Active/Completed)
        if filter_status == 'completed' and pct < 100: continue
        if filter_status == 'active' and pct == 100: continue

        # D. Tempel Data Tambahan ke Objek (Monkey Patching untuk Template)
        enroll.progress_percent = pct
        enroll.total_modules = total
        enroll.completed_count = completed
        enroll.first_module_id = resume_id
        
        final_list.append(enroll)

    # 5. Sorting (Pengurutan List)
    if sort_option == 'a-z':
        final_list.sort(key=lambda x: x.course.course_name.lower())
    elif sort_option == 'z-a':
        final_list.sort(key=lambda x: x.course.course_name.lower(), reverse=True)
    elif sort_option == 'oldest':
        final_list.sort(key=lambda x: x.enrolled_at) # Berdasarkan tanggal daftar
    else: # newest (Default)
        final_list.sort(key=lambda x: x.enrolled_at, reverse=True)

    # 6. Pagination (9 Item per halaman)
    paginator = Paginator(final_list, 9)
    page_number = request.GET.get('page', 1)
    page_obj = paginator.get_page(page_number)

    context = {
        'enrollments': page_obj, # Objek Page dikirim ke template
        'nama_mahasiswa': request.session.get('name', 'Mahasiswa'),
        'search_query': search_query,
        'sort_option': sort_option,
        'filter_status': filter_status
    }

    # 7. Response AJAX (Hanya render potongan kartu)
    if request.headers.get('x-requested-with') == 'XMLHttpRequest':
        return render(request, 'components/my_learning_content.html', context)

    # 8. Response Halaman Penuh
    return render(request, 'mahasiswa/my_learning.html', context)

def profile_view(request):
    # 1. Ambil user_id dari session (Sistem login manual Anda)
    user_id = request.session.get('user_id')
    
    if not user_id:
        return redirect('login_view')
    
    try:
        # 2. Ambil objek User manual dari database
        user = User.objects.get(user_id=user_id)
    except User.DoesNotExist:
        # Jika user di session tidak ada di DB, logout paksa
        return redirect('logout_view')

    # 3. Kirim objek 'user' manual ini ke template
    context = {
        'user': user,  # Sekarang template bisa akses {{ user.email }}, {{ user.username }}, dll
        'role': request.session.get('role_name')
    }
    return render(request, 'profile.html', context)


def update_profile_ajax(request):
    # 1. Cek Login via Session
    user_id = request.session.get('user_id')
    if not user_id:
        return JsonResponse({'status': 'error', 'message': 'Sesi habis, silakan login kembali.'})

    try:
        user = User.objects.get(user_id=user_id)
    except User.DoesNotExist:
        return JsonResponse({'status': 'error', 'message': 'User tidak ditemukan.'})

    action = request.POST.get('action')

    try:
        # --- CASE 1: UPDATE INFO PRIBADI ---
        if action == 'update_info':
            # Gunakan .get() agar tidak error jika key tidak dikirim
            username = request.POST.get('username')
            email = request.POST.get('email')
            # Catatan: Di User model Anda sepertinya field-nya 'name', bukan first_name/last_name
            # Sesuaikan dengan model Anda. Jika model pakai 'name', gabungkan atau pakai salah satu.
            # Asumsi dari kode login: user.name
            
            # Jika form mengirim first_name & last_name, kita gabung jadi name (karena User model pakai name)
            first_name = request.POST.get('first_name', '')
            last_name = request.POST.get('last_name', '')
            
            # Logic: Jika form Profile Anda inputnya 'username', simpan ke field 'name' di DB
            if username and username != user.name:
                if User.objects.filter(name=username).exists():
                    return JsonResponse({'status': 'error', 'message': 'Username sudah digunakan orang lain.'})
                user.name = username
            
            if email and email != user.email:
                if User.objects.filter(email=email).exists():
                    return JsonResponse({'status': 'error', 'message': 'Email sudah digunakan.'})
                user.email = email

            user.save()
            
            # Update Session Data agar sidebar langsung berubah
            request.session['name'] = user.name

            return JsonResponse({'status': 'success', 'message': 'Profil berhasil diperbarui!'})

        # --- CASE 2: GANTI PASSWORD ---
        elif action == 'change_password':
            old_pass = request.POST.get('old_password')
            new_pass = request.POST.get('new_password')
            confirm_pass = request.POST.get('confirm_password')

            # 1. Validasi Password Lama (Manual Hashing Check)
            if not check_password(old_pass, user.password):
                return JsonResponse({'status': 'error', 'message': 'Password saat ini salah.'})

            # 2. Validasi Match Password Baru
            if new_pass != confirm_pass:
                return JsonResponse({'status': 'error', 'message': 'Konfirmasi password baru tidak cocok.'})
            
            # 3. Simpan Password (Manual Hashing Make)
            user.password = make_password(new_pass)
            user.save()

            return JsonResponse({'status': 'success', 'message': 'Password berhasil diubah!'})

    except Exception as e:
        return JsonResponse({'status': 'error', 'message': f'Terjadi kesalahan: {str(e)}'})

    return JsonResponse({'status': 'error', 'message': 'Aksi tidak valid.'})

def chat_index(request):
    # Redirect ke course pertama yang dimiliki user agar tidak kosong
    user_id = request.session.get('user_id')
    if not user_id: return redirect('login_view')

    # Cari course dimana user terdaftar (untuk mhs) atau pengajar (untuk dosen)
    if request.session.get('role_name') == 'Dosen':
        first_course = Course.objects.filter(lecturer_id=user_id).first()
    else:
        enrollment = Enrollment.objects.filter(user_id=user_id).first()
        first_course = enrollment.course if enrollment else None

    if first_course:
        return redirect('chat_room', course_id=first_course.course_id)
    
    return render(request, 'chat/empty.html') # Buat template simple jika belum ada course

def chat_room(request, course_id):
    user_id = request.session.get('user_id')
    if not user_id: return redirect('login_view')

    current_course = get_object_or_404(Course, course_id=course_id)
    
    # Ambil daftar course untuk Sidebar Chat (Agar bisa ganti room)
    if request.session.get('role_name') == 'Dosen':
        my_courses = Course.objects.filter(lecturer_id=user_id)
    else:
        # Untuk mahasiswa, ambil dari enrollment
        enrollments = Enrollment.objects.filter(user_id=user_id).select_related('course')
        my_courses = [e.course for e in enrollments]

    context = {
        'current_course': current_course,
        'my_courses': my_courses,
        'user_id': user_id,
        'user_name': request.session.get('name')
    }
    return render(request, 'chat/room.html', context)

def send_chat_ajax(request):
    if request.method == 'POST':
        user_id = request.session.get('user_id')
        course_id = request.POST.get('course_id')
        message_text = request.POST.get('message')

        if message_text and course_id:
            try:
                user = User.objects.get(user_id=user_id)
                course = Course.objects.get(course_id=course_id)
                
                Discussion.objects.create(
                    user=user,
                    course=course,
                    message=message_text
                )
                return JsonResponse({'status': 'success'})
            except Exception as e:
                return JsonResponse({'status': 'error', 'message': str(e)})
    
    return JsonResponse({'status': 'error'})

def get_chat_ajax(request, course_id):
    # 1. Ambil Info Course (TAMBAHAN BARU)
    try:
        course = Course.objects.select_related('lecturer').get(course_id=course_id)
    except Course.DoesNotExist:
        return JsonResponse({'status': 'error', 'message': 'Kelas tidak ditemukan'})

    last_id = request.GET.get('last_id', 0)
    
    chats = Discussion.objects.filter(
        course_id=course_id, 
        discussion_id__gt=last_id 
    ).select_related('user').order_by('created_at')

    data = []
    for chat in chats:
        time_str = chat.created_at.strftime("%H:%M")
        is_me = chat.user.user_id == request.session.get('user_id')
        
        data.append({
            'id': chat.discussion_id,
            'user': chat.user.name,
            'role': chat.user.role.role_name if chat.user.role else 'User',
            'message': chat.message,
            'time': time_str,
            'is_me': is_me,
            'avatar': chat.user.name[0]
        })
    
    return JsonResponse({
        'status': 'success', 
        'course_name': course.course_name,
        'lecturer_name': course.lecturer.name if course.lecturer else "Tim Pengajar",
        'messages': data
    })

def get_grades_data(request, type, item_id):
    # Proteksi Dosen
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        return JsonResponse({'status': 'error', 'message': 'Unauthorized'}, status=403)

    try:
        # 1. Tentukan Context (Assignment atau Quiz) & Course-nya
        course = None
        item_title = ""
        
        if type == 'assignment':
            item = Assignment.objects.get(assignment_id=item_id)
            course = item.module.course
            item_title = item.title
        elif type == 'quiz':
            item = Quiz.objects.get(quiz_id=item_id)
            course = item.content.module.course
            item_title = item.title
        else:
            return JsonResponse({'status': 'error', 'message': 'Invalid type'})

        # 2. Ambil Semua Mahasiswa yang Terdaftar di Course ini
        enrollments = Enrollment.objects.filter(course=course).select_related('user').order_by('user__name')
        
        student_data = []
        for enroll in enrollments:
            student = enroll.user
            
            # 3. Cari Nilai (Grade) yang sudah ada
            grade_obj = None
            if type == 'assignment':
                grade_obj = Grade.objects.filter(enrollment=enroll, assignment=item).first()
            else:
                grade_obj = Grade.objects.filter(enrollment=enroll, quiz=item).first()
            
            score = grade_obj.score if grade_obj else 0

            feedback = grade_obj.feedback if grade_obj else ""
            
            # 4. Info Tambahan (Status Pengumpulan Tugas)
            submission_status = "-"
            submission_file = None
            submitted_at = None
            
            if type == 'assignment':
                sub = Submission.objects.filter(assignment=item, student=student).first()
                if sub:
                    submission_status = "Diserahkan"
                    submission_file = sub.file_url
                    submitted_at = sub.submitted_at.strftime("%d %b %H:%M")
                else:
                    submission_status = "Belum menyerahkan"
            elif type == 'quiz':
                # Logika quiz otomatis (jika ada) bisa ditaruh sini
                submission_status = "Selesai" if grade_obj else "Belum dikerjakan"

            student_data.append({
                'student_id': student.user_id,
                'name': student.name,
                'avatar': student.name[0],
                'score': score,
                'feedback': feedback,
                'status': submission_status,
                'file_url': submission_file,
                'submitted_at': submitted_at
            })

        return JsonResponse({
            'status': 'success',
            'title': item_title,
            'students': student_data
        })

    except Exception as e:
        return JsonResponse({'status': 'error', 'message': str(e)})

def update_grade_ajax(request):
    if request.method == 'POST':
        if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
            return JsonResponse({'status': 'error', 'message': 'Unauthorized'}, status=403)

        try:
            student_id = request.POST.get('student_id')
            item_type = request.POST.get('type')
            item_id = request.POST.get('item_id')
            score = request.POST.get('score')
            feedback = request.POST.get('feedback')  # <--- Ambil data feedback

            student = User.objects.get(user_id=student_id)
            dosen = User.objects.get(user_id=request.session['user_id']) # Dosen pengirim pesan
            
            course = None
            assignment = None
            quiz = None
            item_title = ""

            if item_type == 'assignment':
                assignment = Assignment.objects.get(assignment_id=item_id)
                course = assignment.module.course
                item_title = assignment.title
            elif item_type == 'quiz':
                quiz = Quiz.objects.get(quiz_id=item_id)
                course = quiz.content.module.course
                item_title = quiz.title

            enrollment = Enrollment.objects.get(user=student, course=course)

            # 1. Update/Create Grade
            grade, created = Grade.objects.update_or_create(
                enrollment=enrollment,
                assignment=assignment,
                quiz=quiz,
                defaults={
                    'user': student,
                    'course': course,
                    'score': score,
                    'feedback': feedback # Simpan feedback
                }
            )

            # 2. LOGIKA CHAT OTOMATIS
            # Hanya kirim chat jika ada feedback yang ditulis
            if feedback:
                # Format pesan notifikasi
                pesan_review = f"[Otomatis] Review Tugas '{item_title}':\n\nNilai: {score}\nCatatan: {feedback}"
                
                # Cek apakah pesan serupa sudah dikirim baru-baru ini agar tidak spam (opsional)
                # Di sini kita langsung kirim saja
                Message.objects.create(
                    sender=dosen,
                    receiver=student,
                    message_text=pesan_review
                )

            return JsonResponse({'status': 'success', 'message': 'Nilai & Review tersimpan, notifikasi terkirim.'})

        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})

    return JsonResponse({'status': 'error'})

def submit_quiz_ajax(request):
    if request.method == 'POST':
        user_id = request.session.get('user_id')
        if not user_id: 
            return JsonResponse({'status': 'error', 'message': 'Unauthorized'}, status=401)
        
        try:
            quiz_id = request.POST.get('quiz_id')
            user = User.objects.get(user_id=user_id)
            quiz = Quiz.objects.get(quiz_id=quiz_id)
            
            # Ambil Enrollment (Untuk dikaitkan dengan Grade)
            enrollment = Enrollment.objects.filter(user=user, course=quiz.content.module.course).first()
            
            # Logika Penilaian Otomatis
            questions = quiz.questions.all()
            total_questions = questions.count()
            correct_count = 0
            
            if total_questions == 0:
                return JsonResponse({'status': 'error', 'message': 'Quiz ini belum memiliki soal.'})

            # Loop setiap soal dan cek jawaban
            for q in questions:
                # Jawaban dikirim dengan format name="answers[ID_SOAL]"
                submitted_answer = request.POST.get(f'answers[{q.question_id}]')
                if submitted_answer == q.correct_answer:
                    correct_count += 1
            
            # Hitung Nilai (Skala 100)
            final_score = (correct_count / total_questions) * 100
            
            # Simpan ke Database (Update jika sudah ada, Create jika belum)
            Grade.objects.update_or_create(
                user=user,
                quiz=quiz,
                defaults={
                    'course': quiz.content.module.course,
                    'enrollment': enrollment,
                    'score': final_score
                }
            )
            
            return JsonResponse({
                'status': 'success', 
                'score': final_score,
                'correct_count': correct_count,
                'total_questions': total_questions,
                'message': f'Kuis selesai! Nilai Anda: {final_score}'
            })

        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})
            
    return JsonResponse({'status': 'error'})

def get_contact_list(user_id, role_name):
    """
    Helper untuk mendapatkan daftar kontak yang relevan.
    - Mahasiswa melihat Dosen dari kelas yang diikuti.
    - Dosen melihat Mahasiswa yang ada di kelasnya.
    """
    contacts = []
    
    if role_name == 'Mahasiswa':
        # Ambil enrollment -> Ambil Course -> Ambil Dosen
        enrollments = Enrollment.objects.filter(user_id=user_id).select_related('course__lecturer')
        lecturer_ids = enrollments.values_list('course__lecturer_id', flat=True).distinct()
        contacts = User.objects.filter(user_id__in=lecturer_ids)
        
    elif role_name == 'Dosen':
        # Ambil Course saya -> Ambil Enrollment di course itu -> Ambil User (Mahasiswa)
        my_courses = Course.objects.filter(lecturer_id=user_id)
        student_ids = Enrollment.objects.filter(course__in=my_courses).values_list('user_id', flat=True).distinct()
        contacts = User.objects.filter(user_id__in=student_ids)
    
    return contacts

def private_chat_index(request):
    user_id = request.session.get('user_id')
    role_name = request.session.get('role_name')
    if not user_id: return redirect('login_view')

    # Cari kontak pertama untuk redirect
    contacts = get_contact_list(user_id, role_name)
    
    if contacts.exists():
        return redirect('private_chat_room', other_user_id=contacts.first().user_id)
    
    # Jika tidak ada kontak, render halaman kosong
    return render(request, 'chat/private.html', {'contacts': [], 'current_chat_user': None})

def private_chat_room(request, other_user_id):
    user_id = request.session.get('user_id')
    role_name = request.session.get('role_name')
    if not user_id: return redirect('login_view')

    current_chat_user = get_object_or_404(User, user_id=other_user_id)
    contacts = get_contact_list(user_id, role_name)

    context = {
        'contacts': contacts,
        'current_chat_user': current_chat_user,
        'user_id': user_id,
        'user_name': request.session.get('name')
    }
    return render(request, 'chat/private.html', context)

def send_private_msg_ajax(request):
    if request.method == 'POST':
        sender_id = request.session.get('user_id')
        receiver_id = request.POST.get('receiver_id')
        message_text = request.POST.get('message')

        if message_text and receiver_id and sender_id:
            try:
                sender = User.objects.get(user_id=sender_id)
                receiver = User.objects.get(user_id=receiver_id)
                
                Message.objects.create(
                    sender=sender,
                    receiver=receiver,
                    message_text=message_text
                )
                return JsonResponse({'status': 'success'})
            except Exception as e:
                return JsonResponse({'status': 'error', 'message': str(e)})
    
    return JsonResponse({'status': 'error'})

def get_private_msg_ajax(request, other_user_id):
    user_id = request.session.get('user_id')
    if not user_id: return JsonResponse({'status': 'error'}, status=403)

    last_id = request.GET.get('last_id', 0)
    
    # Query pesan: (Saya pengirim DAN Dia penerima) ATAU (Dia pengirim DAN Saya penerima)
    # DAN ID pesan > last_id (untuk polling efisien)
    messages = Message.objects.filter(
        (Q(sender_id=user_id) & Q(receiver_id=other_user_id)) |
        (Q(sender_id=other_user_id) & Q(receiver_id=user_id))
    ).filter(message_id__gt=last_id).order_by('sent_at')

    data = []
    for msg in messages:
        time_str = msg.sent_at.strftime("%H:%M")
        is_me = msg.sender.user_id == user_id
        
        data.append({
            'id': msg.message_id,
            'text': msg.message_text,
            'time': time_str,
            'is_me': is_me,
            'avatar': msg.sender.name[0]
        })
    
    return JsonResponse({
        'status': 'success',
        'messages': data
    })

def landing_page(request):
    # Jika user sudah login, redirect langsung ke dashboard masing-masing
    if request.session.get('user_id'):
        role = request.session.get('role_name')
        if role == 'Dosen':
            return redirect('dosen_dashboard')
        elif role == 'Mahasiswa':
            return redirect('mahasiswa_dashboard')
    
    return render(request, 'landing_page.html')

def tambah_course(request):
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        return redirect('login_view')

    if request.method == 'POST':
        course_name = request.POST.get('course_name')
        description = request.POST.get('description')
        user_id = request.session['user_id']

        try:
            lecturer = User.objects.get(user_id=user_id)
            course = Course.objects.create(
                course_name=course_name,
                description=description,
                lecturer=lecturer
            )
            messages.success(request, "Course berhasil dibuat!")
            # Redirect ke edit agar bisa langsung tambah modul
            return redirect('edit_course', course_id=course.course_id) 

        except Exception as e:
            messages.error(request, f"Terjadi kesalahan: {e}")

    return render(request, 'course/form_course.html')

def edit_course(request, course_id):
    # 1. Cek Login & Role
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        return redirect('login_view')

    user_id = request.session['user_id']
    course = get_object_or_404(Course, course_id=course_id, lecturer_id=user_id)

    # 2. PROSES UPDATE COURSE
    if request.method == 'POST':
        course.course_name = request.POST.get('course_name')
        course.description = request.POST.get('description')
        course.save()
        messages.success(request, "Informasi course berhasil diperbarui.")
        return redirect('dosen_dashboard')

    # 3. AMBIL DAFTAR MODUL UNTUK COURSE INI (REVISI)
    modules = Module.objects.filter(course=course).order_by('created_at')

    return render(request, 'course/form_course.html', {
        'course': course,
        'modules': modules # Kirim data modul ke template
    })

def get_notifications_ajax(request):
    user_id = request.session.get('user_id')
    if not user_id:
        return JsonResponse({'status': 'error'}, status=403)

    try:
        # 1. Ambil Pesan Pribadi Terbaru (Receiver = Saya)
        # Kita ambil 3 pesan terbaru yang diterima
        private_msgs = Message.objects.filter(receiver_id=user_id).select_related('sender').order_by('-sent_at')[:3]
        
        # 2. Ambil Diskusi Kelas Terbaru (Dari Course yang diikuti)
        # Logic: Cari course yg user enroll (jika mhs) atau ajar (jika dosen)
        role_name = request.session.get('role_name')
        my_course_ids = []
        
        if role_name == 'Mahasiswa':
            my_course_ids = Enrollment.objects.filter(user_id=user_id).values_list('course_id', flat=True)
        elif role_name == 'Dosen':
            my_course_ids = Course.objects.filter(lecturer_id=user_id).values_list('course_id', flat=True)
            
        # Ambil diskusi terbaru DARI ORANG LAIN (bukan saya) di course saya
        # Limit 3 diskusi terbaru
        discussions = Discussion.objects.filter(
            course_id__in=my_course_ids
        ).exclude(user_id=user_id).select_related('user', 'course').order_by('-created_at')[:3]

        # 3. Gabungkan & Format Data
        notif_list = []
        
        # Format Pesan Pribadi
        for msg in private_msgs:
            notif_list.append({
                'type': 'message',
                'id': msg.message_id,
                'sender': msg.sender.name,
                'avatar': msg.sender.name[0],
                'text': msg.message_text[:40] + '...' if len(msg.message_text) > 40 else msg.message_text,
                'time': msg.sent_at.strftime("%d %b, %H:%M"),
                'timestamp': msg.sent_at.timestamp(),
                'url': f'/messages/{msg.sender.user_id}/' # Link ke private chat
            })
            
        # Format Diskusi
        for disc in discussions:
            notif_list.append({
                'type': 'discussion',
                'id': disc.discussion_id,
                'sender': disc.user.name,
                'avatar': disc.user.name[0],
                'text': f"di {disc.course.course_name}: {disc.message[:30]}...",
                'time': disc.created_at.strftime("%d %b, %H:%M"),
                'timestamp': disc.created_at.timestamp(),
                'url': f'/chat/{disc.course.course_id}/' # Link ke group chat
            })
            
        # Sort gabungan berdasarkan waktu terbaru
        notif_list.sort(key=lambda x: x['timestamp'], reverse=True)
        
        # Ambil 5 teratas saja untuk dropdown
        final_notifs = notif_list[:5]
        
        return JsonResponse({
            'status': 'success',
            'notifications': final_notifs,
            'count': len(final_notifs) # Bisa dipakai untuk badge merah angka
        })

    except Exception as e:
        return JsonResponse({'status': 'error', 'message': str(e)})

def course_catalog(request):
    if not request.session.get('user_id') or request.session.get('role_name') != 'Mahasiswa':
        return redirect('login_view')
    
    user_id = request.session['user_id']
    enrolled_ids = list(Enrollment.objects.filter(user_id=user_id).values_list('course_id', flat=True))
    
    # 1. Ambil Parameter
    search_query = request.GET.get('q', '').lower()
    sort_option = request.GET.get('sort', 'newest')
    filter_type = request.GET.get('filter', 'all')
    page_number = request.GET.get('page', 1)

    # 2. Query
    courses_qs = Course.objects.all().select_related('lecturer')

    # Filter
    if filter_type == 'available':
        courses_qs = courses_qs.exclude(course_id__in=enrolled_ids)
    elif filter_type == 'enrolled':
        courses_qs = courses_qs.filter(course_id__in=enrolled_ids)

    # Search
    if search_query:
        courses_qs = courses_qs.filter(
            Q(course_name__icontains=search_query) | 
            Q(description__icontains=search_query) |
            Q(lecturer__name__icontains=search_query)
        )

    # Sort
    if sort_option == 'a-z':
        courses_qs = courses_qs.order_by('course_name')
    elif sort_option == 'z-a':
        courses_qs = courses_qs.order_by('-course_name')
    elif sort_option == 'oldest':
        courses_qs = courses_qs.order_by('created_at')
    else: # newest
        courses_qs = courses_qs.order_by('-created_at')

    # Pagination (9 item per page)
    paginator = Paginator(courses_qs, 9)
    page_obj = paginator.get_page(page_number)

    context = {
        'courses': page_obj,
        'enrolled_ids': enrolled_ids,
        'search_query': search_query,
        'sort_option': sort_option,
        'filter_type': filter_type,
    }
    
    # --- LOGIC AJAX ---
    # Jika request datang dari JavaScript, render hanya bagian kontennya saja
    if request.headers.get('x-requested-with') == 'XMLHttpRequest':
        return render(request, 'components/catalog_content.html', context)
    
    # Jika akses biasa, render full page
    return render(request, 'mahasiswa/list_course.html', context)

def list_course(request):
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        return redirect('login_view')
    
    user_id = request.session['user_id']
    
    # 1. Base Query
    # Kita annotate jumlah modul dan siswa agar bisa ditampilkan di tabel
    courses_qs = Course.objects.filter(lecturer_id=user_id).annotate(
        module_count=Count('module__module_id', distinct=True),
        student_count=Count('enrollment__enrollment_id', distinct=True)
    )

    # 2. Search
    search_query = request.GET.get('q', '')
    if search_query:
        courses_qs = courses_qs.filter(course_name__icontains=search_query)

    # 3. Sort
    sort_option = request.GET.get('sort', 'newest')
    if sort_option == 'a-z':
        courses_qs = courses_qs.order_by('course_name')
    elif sort_option == 'z-a':
        courses_qs = courses_qs.order_by('-course_name')
    elif sort_option == 'oldest':
        courses_qs = courses_qs.order_by('created_at')
    else: # newest
        courses_qs = courses_qs.order_by('-created_at')

    # 4. Pagination
    paginator = Paginator(courses_qs, 10)
    page_number = request.GET.get('page', 1)
    page_obj = paginator.get_page(page_number)

    context = {
        'courses': page_obj,
        'search_query': search_query,
        'sort_option': sort_option
    }

    # AJAX Response
    if request.headers.get('x-requested-with') == 'XMLHttpRequest':
        return render(request, 'components/course_list_content.html', context)

    return render(request, 'course/list_course.html', context)

def hapus_course(request, course_id):
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        return redirect('login_view')

    if request.method == 'POST':
        try:
            course = get_object_or_404(Course, course_id=course_id, lecturer_id=request.session['user_id'])
            course.delete()
            messages.success(request, "Course berhasil dihapus.")
        except Exception as e:
            messages.error(request, f"Gagal menghapus: {e}")
    
    return redirect('list_course')

def about_us(request):
    return render(request, 'about_us.html')