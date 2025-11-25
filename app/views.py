from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth.hashers import check_password
from .models import User, Role, Module, Course, Enrollment, Assignment, Quiz, AssignmentFile, ModuleContent, Question, Submission
from django.http import JsonResponse
from django.db.models import Max
from django.utils.dateparse import parse_datetime
from django.utils import timezone
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import get_object_or_404
from django.db import transaction
from django.db.models import Count
import json

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
        messages.error(request, 'Akses ditolak. Dosen only.')
        return redirect('login_view')

    user_id = request.session['user_id']
    nama_dosen = request.session.get('name', 'Dosen')

    courses = Course.objects.filter(lecturer_id=user_id)
    
    modules = Module.objects.filter(course__in=courses).order_by('-created_at')

    total_courses = courses.count()
    total_modules = modules.count()
    total_students = Enrollment.objects.filter(course__in=courses).count()

    context = {
        'nama_dosen': nama_dosen,
        'courses': courses,
        'modules': modules,        
        'total_courses': total_courses,
        'total_modules': total_modules,
        'total_students': total_students
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
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        return redirect('login_view')

    user_id = request.session['user_id']
    dosen_courses = Course.objects.filter(lecturer_id=user_id)

    if request.method == 'POST':
        title = request.POST.get('title')
        description = request.POST.get('description') 
        course_id = request.POST.get('course')

        try:
            course = get_object_or_404(Course, course_id=course_id, lecturer_id=user_id)
            Module.objects.create(title=title, description=description, course=course)
            
            messages.success(request, f"Modul berhasil ditambahkan.")
            return redirect('dosen_dashboard')

        except Exception as e:
            messages.error(request, f"Error: {e}")

    context = {'dosen_courses': dosen_courses}
    return render(request, 'modul/form_modul.html', context)

def hapus_modul(request, modul_id):
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        return redirect('login_view')

    user_id = request.session['user_id']

    if request.method == 'POST':
        try:
            module = get_object_or_404(Module, module_id=modul_id, course__lecturer_id=user_id)
            module.delete()
            messages.success(request, "Modul berhasil dihapus.")
        except Exception as e:
            messages.error(request, f"Error: {e}")

    # Redirect ke dashboard setelah hapus
    return redirect('dosen_dashboard')

def mahasiswa_dashboard(request):
    if not request.session.get('user_id') or request.session.get('role_name') != 'Mahasiswa':
        return redirect('login_view')
    
    user_id = request.session['user_id']
    nama_mahasiswa = request.session.get('name', 'Mahasiswa')
    
    # 1. Active Courses (Enrolled)
    enrollments = Enrollment.objects.filter(user_id=user_id).select_related('course', 'last_module')
    
    active_courses = []
    for enroll in enrollments:
        course = enroll.course
        # Calculate logic (Simplified for now)
        total_modules = Module.objects.filter(course=course).count()
        
        # Determine resume link: Last accessed module OR first module
        resume_id = enroll.last_module.module_id if enroll.last_module else None
        if not resume_id:
            first_mod = Module.objects.filter(course=course).order_by('created_at').first()
            if first_mod: resume_id = first_mod.module_id

        active_courses.append({
            'course': course,
            'total_modules': total_modules,
            'first_module_id': resume_id,
            'progress_percent': 0, # Implement progress logic here if needed
            'completed_count': 0
        })

    # 2. [UPDATED] Available Courses (Fetch ALL for recommendation cards)
    # Exclude courses user is already enrolled in if you prefer, 
    # but fetching all is fine since Detail Page handles "Already Enrolled" status.
    available_courses = Course.objects.all().select_related('lecturer')

    context = {
        'nama_mahasiswa': nama_mahasiswa,
        'active_courses': active_courses,
        'available_courses': available_courses  # Pass this to template
    }
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
    
    if assignment:
        submission = Submission.objects.filter(assignment=assignment, student_id=user_id).first()

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
    }

    return render(request, 'modul/detail_modul.html', context)

def list_modul(request):
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        return redirect('login_view')
    user_id = request.session['user_id']
    dosen_courses = Course.objects.filter(lecturer_id=user_id)
    modules = Module.objects.filter(course__in=dosen_courses).order_by('course__course_name', 'title')
    return render(request, 'modul/list_modul.html', {'modules': modules})

# --- 3. FUNGSI BARU: CRUD KONTEN (HALAMAN) ---

# Helper kecil untuk convert URL Youtube (copas dari logic Model biar konsisten)
def get_embed_url_helper(url):
    if not url: return ""
    
    video_id = ""
    if "v=" in url:
        try:
            video_id = url.split('v=')[1].split('&')[0]
        except IndexError:
            return url
    elif "youtu.be" in url:
        try:
            video_id = url.split('/')[-1].split('?')[0]
        except IndexError:
            return url
            
    if video_id:
        return f"https://www.youtube.com/embed/{video_id}"
        
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

    video_url = None
    # LOGIKA BARU: Panggil method dari model, sama seperti template dosen
    if hasattr(content, 'get_embed_url') and callable(getattr(content, 'get_embed_url')):
        video_url = content.get_embed_url()
    elif content.video_url:
        # Fallback jika ternyata bukan method
        video_url = content.video_url

    data = {
        'status': 'success',
        'id': content.content_id,
        'title': content.title,
        'text_content': content.text_content,
        'video_url': video_url, # Ini sekarang berisi URL hasil olahan model
        'type': 'video' if video_url else 'text',
    }
    return JsonResponse(data)