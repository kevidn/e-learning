from django.core.management.base import BaseCommand
from django.contrib.auth.hashers import make_password
from django.utils import timezone
from app.models import Role, User, Course, Module, ModuleContent, Discussion, Enrollment, Assignment, Grade, Question, Quiz

class Command(BaseCommand):
    help = 'Mengisi database dengan data awal (Seeder) yang SANGAT LENGKAP'

    def handle(self, *args, **kwargs):
        self.stdout.write(self.style.WARNING("Menghapus data lama..."))
        # Hapus urut dari child ke parent
        Discussion.objects.all().delete()
        Grade.objects.all().delete()
        Question.objects.all().delete()
        Quiz.objects.all().delete()
        Assignment.objects.all().delete()
        Enrollment.objects.all().delete()
        ModuleContent.objects.all().delete()
        Module.objects.all().delete()
        Course.objects.all().delete()
        User.objects.all().delete()
        Role.objects.all().delete()

        # ==========================================
        # 1. ROLES & USERS
        # ==========================================
        self.stdout.write("Membuat Roles & Users...")
        role_admin = Role.objects.create(role_name='Admin')
        role_dosen = Role.objects.create(role_name='Dosen')
        role_mhs = Role.objects.create(role_name='Mahasiswa')

        pw = make_password('123456')

        # Admin
        User.objects.create(name='Super Admin', email='admin@khacademy.id', password=pw, role=role_admin)

        # Dosen
        pak_budi = User.objects.create(name='Pak Budi Santoso', email='budi@kampus.ac.id', password=pw, role=role_dosen)
        bu_rina = User.objects.create(name='Bu Rina Aisyah', email='rina@kampus.ac.id', password=pw, role=role_dosen)
        pak_joko = User.objects.create(name='Pak Joko Anwar', email='joko@kampus.ac.id', password=pw, role=role_dosen)
        bu_sari = User.objects.create(name='Bu Sari Dewi', email='sari@kampus.ac.id', password=pw, role=role_dosen)

        # Mahasiswa
        andi = User.objects.create(name='Andi Saputra', email='andi@mhs.ac.id', password=pw, role=role_mhs)
        siti = User.objects.create(name='Siti Aminah', email='siti@mhs.ac.id', password=pw, role=role_mhs)
        budi_k = User.objects.create(name='Budi Kecil', email='budik@mhs.ac.id', password=pw, role=role_mhs)
        citra = User.objects.create(name='Citra Kirana', email='citra@mhs.ac.id', password=pw, role=role_mhs)
        deni = User.objects.create(name='Deni Sumargo', email='deni@mhs.ac.id', password=pw, role=role_mhs)

        # ==========================================
        # 2. COURSE 1: WEB DEV (Pak Budi)
        # ==========================================
        self.stdout.write("Course 1: Web Development...")
        c_web = Course.objects.create(
            course_name='Fullstack Web Development (Django & React)',
            description='Panduan lengkap menjadi Fullstack Developer. Membahas backend dengan Django dan frontend modern menggunakan ReactJS.',
            lecturer=pak_budi
        )

        # Modul 1
        m1_web = Module.objects.create(course=c_web, title='Pengenalan Web & HTTP', description='Konsep dasar internet.')
        ModuleContent.objects.create(module=m1_web, title='Cara Kerja Internet', text_content='Internet bekerja melalui protokol TCP/IP...', video_url='https://www.youtube.com/watch?v=7_LPdttKXPc', order=1)
        ModuleContent.objects.create(module=m1_web, title='Request & Response Cycle', text_content='Memahami GET, POST, PUT, DELETE...', order=2)
        
        # Modul 2
        m2_web = Module.objects.create(course=c_web, title='Backend dengan Django', description='Membangun API yang kuat.')
        content_mvt = ModuleContent.objects.create(module=m2_web, title='Arsitektur MVT', text_content='Django menggunakan pola MVT...', video_url='https://www.youtube.com/watch?v=t3G8Y8rR2P0', order=1)
        ModuleContent.objects.create(module=m2_web, title='Routing & Views', text_content='Konfigurasi urls.py dan views.py...', order=2)

        # Quiz Web
        q_web = Quiz.objects.create(content=content_mvt, title='Kuis Pemahaman MVT', description='Tes singkat tentang Model View Template.')
        Question.objects.create(quiz=q_web, question_text='Apa kepanjangan MVT?', option_a='Model View Template', option_b='Model View Controller', option_c='Main View Table', option_d='Model Visual Tech', correct_answer='A')
        Question.objects.create(quiz=q_web, question_text='File apa yang mengatur routing?', option_a='models.py', option_b='views.py', option_c='urls.py', option_d='tests.py', correct_answer='C')

        # Tugas Web
        Assignment.objects.create(module=m2_web, title='Membuat Blog API', description='Buat API sederhana untuk CRUD artikel blog.', deadline=timezone.now() + timezone.timedelta(days=7))

        # ==========================================
        # 3. COURSE 2: DATA SCIENCE (Bu Rina)
        # ==========================================
        self.stdout.write("Course 2: Data Science...")
        c_ds = Course.objects.create(
            course_name='Data Science Bootcamp 2024',
            description='Belajar mengolah data dari nol sampai mahir menggunakan Python, Pandas, Scikit-Learn, dan Tableau.',
            lecturer=bu_rina
        )

        # Modul 1
        m1_ds = Module.objects.create(course=c_ds, title='Python for Data Science', description='Syntax Python yang sering dipakai.')
        ModuleContent.objects.create(module=m1_ds, title='Numpy Arrays', text_content='Numpy adalah library fundamental...', order=1)
        ModuleContent.objects.create(module=m1_ds, title='Pandas Dataframe', text_content='Cara manipulasi data tabular...', video_url='https://www.youtube.com/watch?v=vmEHCJofslg', order=2)

        # Modul 2
        m2_ds = Module.objects.create(course=c_ds, title='Exploratory Data Analysis', description='Mencari insight dari data mentah.')
        ModuleContent.objects.create(module=m2_ds, title='Data Cleaning', text_content='Mengatasi missing values...', order=1)
        ModuleContent.objects.create(module=m2_ds, title='Data Visualization', text_content='Membuat grafik dengan Matplotlib...', order=2)

        Assignment.objects.create(module=m2_ds, title='Analisis Dataset Titanic', description='Lakukan EDA pada dataset Titanic dan buat laporan PDF.', deadline=timezone.now() + timezone.timedelta(days=5))

        # ==========================================
        # 4. COURSE 3: UI/UX DESIGN (Bu Sari)
        # ==========================================
        self.stdout.write("Course 3: UI/UX Design...")
        c_ui = Course.objects.create(
            course_name='UI/UX Design Masterclass',
            description='Belajar mendesain aplikasi yang user-friendly menggunakan Figma dan prinsip Design Thinking.',
            lecturer=bu_sari
        )

        m1_ui = Module.objects.create(course=c_ui, title='Design Thinking', description='Pola pikir desainer.')
        ModuleContent.objects.create(module=m1_ui, title='Empathize & Define', text_content='Memahami kebutuhan user...', video_url='https://www.youtube.com/watch?v=_r0VX-aU_T8', order=1)
        
        m2_ui = Module.objects.create(course=c_ui, title='Figma Essentials', description='Tools dasar Figma.')
        ModuleContent.objects.create(module=m2_ui, title='Intro to Figma Interface', text_content='Penjelasan toolbar dan layer...', order=1)
        ModuleContent.objects.create(module=m2_ui, title='Auto Layout & Components', text_content='Fitur powerful Figma...', order=2)

        Assignment.objects.create(module=m2_ui, title='Redesign Aplikasi Gojek', description='Buat ulang halaman home aplikasi Gojek dengan style baru.', deadline=timezone.now() + timezone.timedelta(days=10))

        # ==========================================
        # 5. COURSE 4: CYBER SECURITY (Pak Joko)
        # ==========================================
        self.stdout.write("Course 4: Cyber Security...")
        c_sec = Course.objects.create(
            course_name='Ethical Hacking & Cyber Security',
            description='Pelajari cara mengamankan sistem dengan memahami cara kerja penyerang (White Hat Hacker).',
            lecturer=pak_joko
        )

        m1_sec = Module.objects.create(course=c_sec, title='Networking Basics', description='Jaringan komputer dasar.')
        ModuleContent.objects.create(module=m1_sec, title='OSI Layer', text_content='7 Lapisan OSI Layer...', order=1)
        ModuleContent.objects.create(module=m1_sec, title='TCP vs UDP', text_content='Perbedaan protokol pengiriman data...', order=2)

        m2_sec = Module.objects.create(course=c_sec, title='Web Penetration Testing', description='Mencari celah keamanan web.')
        ModuleContent.objects.create(module=m2_sec, title='SQL Injection', text_content='Cara kerja dan pencegahan SQLi...', video_url='https://www.youtube.com/watch?v=ciNHn38EyRc', order=1)
        ModuleContent.objects.create(module=m2_sec, title='XSS (Cross Site Scripting)', text_content='Bahaya script asing di browser...', order=2)

        # ==========================================
        # 6. COURSE 5: DIGITAL MARKETING (Bu Sari)
        # ==========================================
        self.stdout.write("Course 5: Digital Marketing...")
        c_mkt = Course.objects.create(
            course_name='Digital Marketing Strategy',
            description='Strategi pemasaran digital melalui SEO, SEM, dan Social Media Ads.',
            lecturer=bu_sari
        )
        m1_mkt = Module.objects.create(course=c_mkt, title='SEO Fundamentals', description='Optimasi mesin pencari.')
        ModuleContent.objects.create(module=m1_mkt, title='On-Page vs Off-Page SEO', text_content='Teknik optimasi konten...', order=1)

        # ==========================================
        # 7. COURSE 6: MOBILE DEV (Pak Budi)
        # ==========================================
        self.stdout.write("Course 6: Mobile Development...")
        c_mob = Course.objects.create(
            course_name='Flutter Mobile Apps',
            description='Satu codebase untuk Android dan iOS menggunakan Flutter & Dart.',
            lecturer=pak_budi
        )
        m1_mob = Module.objects.create(course=c_mob, title='Dart Language', description='Dasar bahasa Dart.')
        ModuleContent.objects.create(module=m1_mob, title='Variable & Function', text_content='Sintaks dasar Dart...', order=1)

        # ==========================================
        # 8. ENROLLMENTS (PENDAFTARAN)
        # ==========================================
        self.stdout.write("Mendaftarkan Mahasiswa...")
        
        # Andi (Ambisius, ikut banyak kelas)
        Enrollment.objects.create(user=andi, course=c_web)
        Enrollment.objects.create(user=andi, course=c_mob)
        Enrollment.objects.create(user=andi, course=c_sec)

        # Siti (Data Enthusiast)
        Enrollment.objects.create(user=siti, course=c_ds)
        Enrollment.objects.create(user=siti, course=c_web)

        # Budi Kecil (Design Enthusiast)
        Enrollment.objects.create(user=budi_k, course=c_ui)
        Enrollment.objects.create(user=budi_k, course=c_mkt)

        # Citra & Deni (General)
        Enrollment.objects.create(user=citra, course=c_web)
        Enrollment.objects.create(user=citra, course=c_ui)
        Enrollment.objects.create(user=deni, course=c_sec)
        Enrollment.objects.create(user=deni, course=c_ds)

        # ==========================================
        # 9. DISKUSI & CHAT
        # ==========================================
        self.stdout.write("Membuat Percakapan Diskusi...")
        
        # Diskusi di Web Dev
        Discussion.objects.create(course=c_web, user=andi, message='Pak, untuk tugas Blog API apakah boleh pakai DRF?')
        Discussion.objects.create(course=c_web, user=pak_budi, message='Boleh banget Andi, justru sangat disarankan.')
        Discussion.objects.create(course=c_web, user=siti, message='Saya masih bingung konsep Serializer pak.')
        
        # Diskusi di UI/UX
        Discussion.objects.create(course=c_ui, user=budi_k, message='Bu, plugin Figma yang bagus untuk icon apa ya?')
        Discussion.objects.create(course=c_ui, user=bu_sari, message='Coba pakai Feather Icons atau Material Design Icons.')
        Discussion.objects.create(course=c_ui, user=citra, message='Ijin bertanya, deadline tugas redesign kapan ya bu?')

        # Diskusi di Cyber Sec
        Discussion.objects.create(course=c_sec, user=deni, message='Pak, apakah kita akan praktek pakai Kali Linux?')
        Discussion.objects.create(course=c_sec, user=pak_joko, message='Betul Deni, siapkan Virtual Box kalian ya.')

        self.stdout.write(self.style.SUCCESS(f'Selesai! Database berhasil diisi dengan:\n- {User.objects.count()} Users\n- {Course.objects.count()} Courses\n- {Module.objects.count()} Modules\n- {ModuleContent.objects.count()} Contents\n- {Enrollment.objects.count()} Enrollments'))