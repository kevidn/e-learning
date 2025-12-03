import random
from django.core.management.base import BaseCommand
from django.contrib.auth.hashers import make_password
from django.utils import timezone
from app.models import Role, User, Course, Module, ModuleContent, Discussion, Enrollment, Assignment, Grade, Question, Quiz, Submission, Message

class Command(BaseCommand):
    help = 'Seeder: 10 Mahasiswa, 20 Course, Ratusan Modul (Fix Grade Error & Real Videos)'

    def handle(self, *args, **kwargs):
        self.stdout.write(self.style.WARNING("Menghapus data lama..."))
        
        # ==========================================
        # 1. HAPUS DATA (URUTAN PENTING)
        # ==========================================
        try:
            Message.objects.all().delete()
        except Exception:
            pass

        try:
            Submission.objects.all().delete()
        except Exception:
            pass
        
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
        # 2. ROLES & USERS
        # ==========================================
        self.stdout.write("Membuat Roles & Users...")
        role_admin = Role.objects.create(role_name='Admin')
        role_dosen = Role.objects.create(role_name='Dosen')
        role_mhs = Role.objects.create(role_name='Mahasiswa')
        pw = make_password('123456')

        # Admin
        User.objects.create(name='Super Admin', email='admin@khacademy.id', password=pw, role=role_admin)

        # 5 Dosen
        lecturer_names = ['Pak Budi', 'Bu Rina', 'Pak Joko', 'Bu Sari', 'Pak Teguh']
        lecturers = []
        for name in lecturer_names:
            email = f"{name.split()[-1].lower()}@dosen.ac.id"
            u = User.objects.create(name=name, email=email, password=pw, role=role_dosen)
            lecturers.append(u)

        # 10 Mahasiswa
        students = []
        # Utama
        students.append(User.objects.create(name='Andi Saputra', email='andi@mhs.ac.id', password=pw, role=role_mhs))
        students.append(User.objects.create(name='Siti Aminah', email='siti@mhs.ac.id', password=pw, role=role_mhs))
        students.append(User.objects.create(name='Budi Kecil', email='budik@mhs.ac.id', password=pw, role=role_mhs))
        students.append(User.objects.create(name='Citra Kirana', email='citra@mhs.ac.id', password=pw, role=role_mhs))
        students.append(User.objects.create(name='Deni Sumargo', email='deni@mhs.ac.id', password=pw, role=role_mhs))
        
        # Tambahan
        extras = ['Eko Patrio', 'Fanny Ghassani', 'Gilang Dirga', 'Hesti Purwadinata', 'Irfan Hakim']
        for name in extras:
            email = f"{name.split()[0].lower()}@mhs.ac.id"
            u = User.objects.create(name=name, email=email, password=pw, role=role_mhs)
            students.append(u)

        self.stdout.write(f"   -> Berhasil membuat {len(students)} Mahasiswa.")

        # ==========================================
        # 3. COURSES & MODULES
        # ==========================================
        self.stdout.write("Membuat 20 Courses & Contents...")

        course_list_data = [
            ("Fullstack Web Development", "Django & React"),
            ("Data Science Bootcamp", "Python & Pandas"),
            ("Flutter Mobile Apps", "Android & iOS"),
            ("Cyber Security Ethical Hacking", "Network Security"),
            ("DevOps & Cloud Computing", "AWS & Docker"),
            ("Game Development with Unity", "C# Programming"),
            ("UI/UX Design Masterclass", "Figma & Wireframing"),
            ("Machine Learning A-Z", "AI & Neural Networks"),
            ("Blockchain Fundamentals", "Crypto & Smart Contracts"),
            ("Software QA Testing", "Automated Testing"),
            ("Digital Marketing Strategy", "SEO & Ads"),
            ("Public Speaking Confidence", "Communication Skills"),
            ("Financial Management 101", "Personal Finance"),
            ("Project Management PMP", "Agile & Scrum"),
            ("Microsoft Excel Mastery", "Data Analysis"),
            ("Copywriting for Sales", "Persuasive Writing"),
            ("Branding & Identity", "Building Personal Brand"),
            ("Entrepreneurship Startup", "Business Model Canvas"),
            ("Time Management Hacks", "Productivity"),
            ("Graphic Design for Beginners", "Canva & Photoshop")
        ]

        module_titles_tech = [
            "Introduction & Setup", "Basic Syntax & Variables", "Control Flow Logic",
            "Data Structures", "Object Oriented Programming", "Database Integration",
            "API & Connectivity", "Testing & Debugging", "Deployment Strategies", "Final Project"
        ]
        
        module_titles_general = [
            "Mindset & Fundamentals", "Planning Strategy", "Tools & Resources",
            "Execution Techniques", "Case Study Analysis", "Monitoring & Evaluation",
            "Advanced Tips", "Common Mistakes", "Growth Hacks", "Conclusion"
        ]

        # Daftar video pembelajaran asli dari YouTube (Bukan Rick Roll)
        educational_videos = [
            'https://www.youtube.com/watch?v=_uQrJ0TkZlc', # Python Course
            'https://www.youtube.com/watch?v=F5mRW0jo-U4', # Django Course
            'https://www.youtube.com/watch?v=SqcY0GlETPk', # React Native
            'https://www.youtube.com/watch?v=w7ejDZ8SWv8', # React JS
            'https://www.youtube.com/watch?v=nu_pCVPKzTk', # C++
            'https://www.youtube.com/watch?v=qz0aGYrrlhU', # HTML
            'https://www.youtube.com/watch?v=1Rs2ND1ryYc', # CSS
            'https://www.youtube.com/watch?v=PkZNo7MFNFg', # JavaScript
            'https://www.youtube.com/watch?v=VPvVD8t02U8', # Flutter
            'https://www.youtube.com/watch?v=ua-CiDNNj30', # Data Science
            'https://www.youtube.com/watch?v=nzZkKoREEGo', # Cyber Security
            'https://www.youtube.com/watch?v=7eh4d6sabA0', # Machine Learning
        ]

        all_created_courses = []

        for title, desc in course_list_data:
            lecturer = random.choice(lecturers)
            course = Course.objects.create(
                course_name=title,
                description=f"Panduan lengkap tentang {title}. Membahas {desc} dari dasar hingga mahir.",
                lecturer=lecturer
            )
            all_created_courses.append(course)

            if "Development" in title or "Apps" in title or "Science" in title or "Security" in title:
                titles_pool = module_titles_tech
            else:
                titles_pool = module_titles_general

            num_modules = random.randint(4, 6)
            selected_modules = random.sample(titles_pool, num_modules) 

            for i, mod_title in enumerate(selected_modules, 1):
                mod = Module.objects.create(
                    course=course,
                    title=f"Modul {i}: {mod_title}",
                    description=f"Pembahasan mendalam mengenai {mod_title} dalam konteks {title}."
                )

                for j in range(1, random.randint(3, 4)):
                    # Pilih video secara acak dari daftar video edukasi
                    selected_video = random.choice(educational_videos)
                    
                    ModuleContent.objects.create(
                        module=mod,
                        title=f"{mod_title} - Part {j}",
                        text_content=f"Lorem ipsum content detail untuk {mod_title}. Pelajari materi ini dengan seksama.",
                        video_url=selected_video,
                        order=j
                    )

                if random.random() > 0.5:
                    Assignment.objects.create(
                        module=mod,
                        title=f"Tugas: Praktek {mod_title}",
                        description="Kerjakan latihan sesuai materi video dan upload hasilnya.",
                        deadline=timezone.now() + timezone.timedelta(days=random.randint(3, 14))
                    )

        # ==========================================
        # 4. ENROLLMENTS & INTERACTION
        # ==========================================
        self.stdout.write("Mendaftarkan Mahasiswa & Mengisi Diskusi...")

        for student in students:
            my_courses = random.sample(all_created_courses, random.randint(5, 8))
            
            for course in my_courses:
                Enrollment.objects.create(user=student, course=course)

                if random.random() > 0.7:
                    Discussion.objects.create(
                        course=course,
                        user=student,
                        message=f"Izin bertanya untuk materi {course.course_name}?"
                    )
                    Discussion.objects.create(
                        course=course,
                        user=course.lecturer,
                        message=f"Halo {student.name}, silakan cek referensi ya."
                    )

                assignments = Assignment.objects.filter(module__course=course)
                for asm in assignments:
                    if random.random() > 0.3:
                        score = random.randint(60, 100)
                        
                        Grade.objects.create(
                            user=student,
                            assignment=asm,
                            score=score,
                            feedback="Bagus, tingkatkan lagi." if score > 80 else "Perbaiki format."
                        )

        self.stdout.write(self.style.SUCCESS(f'SEEDER SELESAI! Data berhasil diisi.'))