from django.core.management.base import BaseCommand
from django.contrib.auth.hashers import make_password
from app.models import Role, User, Course, Module, ModuleContent, Discussion

class Command(BaseCommand):
    help = 'Mengisi database dengan data awal (Seeder)'

    def handle(self, *args, **kwargs):
        self.stdout.write("Menghapus data lama...")
        # Hapus data dari anak ke induk untuk menghindari error Foreign Key
        Discussion.objects.all().delete()
        ModuleContent.objects.all().delete()
        Module.objects.all().delete()
        Course.objects.all().delete()
        User.objects.all().delete()
        Role.objects.all().delete()

        self.stdout.write("Membuat Roles...")
        role_admin = Role.objects.create(role_name='Admin')
        role_dosen = Role.objects.create(role_name='Dosen')
        role_mhs = Role.objects.create(role_name='Mahasiswa')

        self.stdout.write("Membuat Users...")
        # Password '123456' di-hash agar aman
        pw_hash = make_password('123456')

        admin = User.objects.create(
            name='Administrator',
            email='admin@kampus.ac.id',
            password=pw_hash,
            role=role_admin
        )

        dosen = User.objects.create(
            name='Pak Budi Santoso',
            email='budi@kampus.ac.id',
            password=pw_hash,
            role=role_dosen
        )

        mhs1 = User.objects.create(
            name='Andi Saputra',
            email='andi@mhs.ac.id',
            password=pw_hash,
            role=role_mhs
        )

        mhs2 = User.objects.create(
            name='Siti Aminah',
            email='siti@mhs.ac.id',
            password=pw_hash,
            role=role_mhs
        )

        self.stdout.write("Membuat Course & Module...")
        course_web = Course.objects.create(
            course_name='Pemrograman Web Lanjut',
            description='Belajar Django Framework dari nol sampai mahir.',
            lecturer=dosen
        )

        modul_1 = Module.objects.create(
            course=course_web,
            title='Pengenalan Django',
            description='Instalasi dan konfigurasi awal.'
        )

        ModuleContent.objects.create(
            module=modul_1,
            title='Apa itu Django?',
            text_content='Django adalah framework Python level tinggi...',
            video_url='https://www.youtube.com/watch?v=F5mRW0jo-U4',
            order=1
        )

        ModuleContent.objects.create(
            module=modul_1,
            title='Setup Virtual Environment',
            text_content='Langkah-langkah membuat venv...',
            order=2
        )

        self.stdout.write("Membuat Diskusi (Chat)...")
        Discussion.objects.create(
            course=course_web,
            user=mhs1, # Andi
            message='Pak, apakah kita perlu install Docker untuk materi ini?'
        )
        
        Discussion.objects.create(
            course=course_web,
            user=dosen, # Pak Budi
            message='Untuk saat ini belum perlu Andi, cukup Python saja.'
        )

        Discussion.objects.create(
            course=course_web,
            user=mhs2, # Siti
            message='Terima kasih infonya Pak.'
        )

        self.stdout.write(self.style.SUCCESS('Selesai! Database berhasil diisi.'))