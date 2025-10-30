from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .models import User, Role, Module, Course, Enrollment

def login_view(request):
    # Jika user sudah login, lempar dia
    if request.session.get('user_id'):
        return redirect('dosen_dashboard') # atau ke mana pun

    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')

        try:
            # 1. Cari user berdasarkan email
            user = User.objects.get(email=email)

            # 2. Cek password (SANGAT TIDAK AMAN, HANYA UNTUK CONTOH INI)
            if user.password == password:
                # 3. Sukses! Simpan data user di session
                request.session['user_id'] = user.user_id
                request.session['name'] = user.name
                request.session['role_name'] = user.role.role_name

                messages.success(request, f'Selamat datang, {user.name}!')

                # 4. Arahkan berdasarkan role
                if user.role.role_name == 'Dosen':
                    return redirect('dosen_dashboard')
                elif user.role.role_name == 'Mahasiswa':
                    return redirect('mahasiswa_dashboard')
                else:
                    # Jika ada role lain (misal Admin)
                    return redirect('login_view')

            else:
                # Jika password salah
                messages.error(request, 'Password salah. Silakan coba lagi.')
                return redirect('login_view')

        except User.DoesNotExist:
            # Jika email tidak ditemukan
            messages.error(request, 'Email tidak terdaftar.')
            return redirect('login_view')

    # Jika method GET (pertama kali buka halaman)
    return render(request, 'login.html')


def logout_view(request):
    try:
        # Hapus semua data session
        del request.session['user_id']
        del request.session['name']
        del request.session['role_name']
    except KeyError:
        pass # Jika session sudah kosong, biarkan

    messages.success(request, 'Anda berhasil logout.')
    return redirect('login_view')


# --- Halaman Dashboard Contoh ---
# Kita akan proteksi halaman ini

def dosen_dashboard(request):
    # Cek apakah user sudah login dan role-nya Dosen
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        messages.error(request, 'Anda harus login sebagai Dosen untuk mengakses halaman ini.')
        return redirect('login_view')

    # Ambil nama dari session
    nama_dosen = request.session.get('name', 'Dosen')
    return render(request, 'dosen_dashboard.html', {'nama_dosen': nama_dosen})


def mahasiswa_dashboard(request):
    # 1. Proteksi: Mahasiswa
    if not request.session.get('user_id') or request.session.get('role_name') != 'Mahasiswa':
        messages.error(request, 'Anda harus login sebagai Mahasiswa untuk mengakses halaman ini.')
        return redirect('login_view')

    user_id = request.session['user_id']
    nama_mahasiswa = request.session.get('name', 'Mahasiswa')

    # 2. Ambil data modul untuk mahasiswa ini
    try:
        # Ambil semua course_id yang diikuti mahasiswa
        enrolled_courses = Enrollment.objects.filter(user_id=user_id).values_list('course_id', flat=True)

        # Ambil semua modul dari mata kuliah tersebut
        modules = Module.objects.filter(course_id__in=enrolled_courses).order_by('course__course_name', 'title')

    except Exception as e:
        modules = []
        messages.error(request, f"Gagal mengambil modul: {e}")

    context = {
        'nama_mahasiswa': nama_mahasiswa,
        'modules': modules # 3. Kirim modul ke template
    }
    return render(request, 'mahasiswa_dashboard.html', context)


# =========================================================
# === TAMBAHKAN FUNGSI BARU DI BAWAH INI ===
# =========================================================

def detail_modul(request, modul_id):
    # 1. Proteksi: Mahasiswa
    if not request.session.get('user_id') or request.session.get('role_name') != 'Mahasiswa':
        messages.error(request, 'Anda harus login sebagai Mahasiswa untuk mengakses halaman ini.')
        return redirect('login_view')

    user_id = request.session['user_id']

    try:
        # 2. Ambil modul
        module = get_object_or_404(Module, module_id=modul_id)

        # 3. Validasi Keamanan:
        # Cek apakah mahasiswa ini terdaftar di mata kuliah (course) dari modul ini
        is_enrolled = Enrollment.objects.filter(user_id=user_id, course_id=module.course.course_id).exists()

        if not is_enrolled:
            messages.error(request, 'Anda tidak terdaftar di mata kuliah untuk modul ini.')
            return redirect('mahasiswa_dashboard')

        # 4. Jika aman, tampilkan
        context = {
            'module': module
        }
        return render(request, 'modul/detail_modul.html', context)

    except Exception as e:
        messages.error(request, f"Tidak dapat menemukan modul. {e}")
        return redirect('mahasiswa_dashboard')


def list_modul(request):
    # 1. Proteksi: Pastikan yang login adalah Dosen
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        messages.error(request, 'Anda harus login sebagai Dosen.')
        return redirect('login_view')

    # 2. Ambil data
    user_id = request.session['user_id']

    # Ambil semua mata kuliah yang diajar oleh Dosen ini
    dosen_courses = Course.objects.filter(lecturer_id=user_id)

    # Ambil semua modul yang termasuk dalam mata kuliah Dosen ini
    modules = Module.objects.filter(course__in=dosen_courses).order_by('course__course_name', 'title')

    context = {
        'modules': modules
    }
    return render(request, 'modul/list_modul.html', context)


def tambah_modul(request):
    # 1. Proteksi: Dosen
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        messages.error(request, 'Anda harus login sebagai Dosen.')
        return redirect('login_view')

    user_id = request.session['user_id']
    dosen_courses = Course.objects.filter(lecturer_id=user_id)

    if request.method == 'POST':
        # 2. Ambil data dari form
        title = request.POST.get('title')
        content = request.POST.get('content')
        course_id = request.POST.get('course')

        try:
            # 3. Validasi & Simpan
            # Pastikan Dosen memilih mata kuliah yang memang dia ajar
            course = get_object_or_404(Course, course_id=course_id, lecturer_id=user_id)

            Module.objects.create(
                title=title,
                content=content,
                course=course
            )
            messages.success(request, f"Modul '{title}' berhasil ditambahkan.")
            return redirect('list_modul')

        except Exception as e:
            messages.error(request, f"Terjadi kesalahan: {e}")

    # 4. Tampilkan form (GET request)
    context = {
        'dosen_courses': dosen_courses
    }
    return render(request, 'modul/form_modul.html', context)


def edit_modul(request, modul_id):
    # 1. Proteksi: Dosen
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        messages.error(request, 'Anda harus login sebagai Dosen.')
        return redirect('login_view')

    user_id = request.session['user_id']

    # 2. Ambil modul yang mau diedit
    # Penting: get_object_or_404 ini juga memvalidasi bahwa Dosen ini
    # adalah pemilik mata kuliah dari modul tersebut (course__lecturer_id=user_id)
    module = get_object_or_404(Module, module_id=modul_id, course__lecturer_id=user_id)
    dosen_courses = Course.objects.filter(lecturer_id=user_id)

    if request.method == 'POST':
        # 3. Ambil data dari form & update
        title = request.POST.get('title')
        content = request.POST.get('content')
        course_id = request.POST.get('course')

        try:
            # Validasi course
            course = get_object_or_404(Course, course_id=course_id, lecturer_id=user_id)

            module.title = title
            module.content = content
            module.course = course
            module.save()

            messages.success(request, f"Modul '{module.title}' berhasil diperbarui.")
            return redirect('list_modul')

        except Exception as e:
            messages.error(request, f"Terjadi kesalahan: {e}")

    # 4. Tampilkan form (GET request)
    context = {
        'module': module,
        'dosen_courses': dosen_courses
    }
    return render(request, 'modul/form_modul.html', context)


def hapus_modul(request, modul_id):
    # 1. Proteksi: Dosen
    if not request.session.get('user_id') or request.session.get('role_name') != 'Dosen':
        messages.error(request, 'Anda harus login sebagai Dosen.')
        return redirect('login_view')

    user_id = request.session['user_id']

    # Hanya terima method POST untuk keamanan
    if request.method == 'POST':
        try:
            # 2. Ambil & Hapus modul
            # Validasi Dosen adalah pemilik
            module = get_object_or_404(Module, module_id=modul_id, course__lecturer_id=user_id)

            title = module.title
            module.delete()

            messages.success(request, f"Modul '{title}' berhasil dihapus.")
        except Exception as e:
            messages.error(request, f"Terjadi kesalahan: {e}")

    # 3. Redirect kembali ke daftar modul
    return redirect('list_modul')