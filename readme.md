[![Typing SVG](https://readme-typing-svg.demolab.com?font=Fira+Code&pause=1000&width=435&lines=Welcome+to+E-Learning)](https://git.io/typing-svg)

Ini adalah portal e-learning sederhana yang dibangun menggunakan **Django** sebagai backend dan **MySQL** sebagai database. Proyek ini memiliki sistem autentikasi kustom yang memisahkan fungsionalitas berdasarkan peran pengguna (Dosen dan Mahasiswa).

Tampilan antarmuka (UI) dibangun menggunakan **Tailwind CSS** dengan tema *glassmorphism* yang modern.

## Fitur Utama

* **Autentikasi Kustom:**
    * Halaman Login (Login)
    * Halaman Registrasi (Register) untuk Mahasiswa
    * Enkripsi *password* otomatis (menggunakan *hash* Django).
* **Peran (Roles) Pengguna:**
    * **Dosen:** Dapat mengelola modul *courses*.
    * **Mahasiswa:** Dapat melihat *courses* dan modul yang mereka ikuti.
* **Dashboard Dosen:**
    * **CRUD** penuh (Create, Read, Update, Delete) untuk Modul *Courses*.
    * Modal konfirmasi penghapusan yang aman (bukan *alert* browser).
* **Dashboard Mahasiswa:**
    * Melihat daftar semua modul dari *courses* yang terdaftar.
    * Melihat detail isi modul.

## Teknologi yang Digunakan

* **Backend:** Python 3, Django 4.x
* **Database:** MySQL (dihubungkan dengan `PyMySQL`)
* **Frontend:** Tailwind CSS (via CDN), Feather Icons dan komponen interaktif sederhana berbasis JavaScript.

## Panduan Instalasi dan Menjalankan

Berikut adalah langkah-langkah untuk menjalankan proyek ini di komputer lain.

### 1. Prasyarat

* Python 3.x
* Server Database MySQL (seperti XAMPP, WAMP, atau MySQL Server)

### 2. Instalasi

1.  **Clone atau Unduh Proyek:**
    Dapatkan semua file proyek ke dalam satu folder.

2.  **Instal Dependensi:**
    Buka terminal di folder proyek dan instal library yang diperlukan:
    ```bash
    pip install django
    pip install PyMySQL
    ```

3.  **Setup Database:**
    * Buka *tool* database Anda (misalnya `phpMyAdmin`).
    * Buat database baru dengan nama `e-learning`.
    * Impor file `e-learning (1).sql` yang Anda miliki ke dalam database `e-learning` tersebut. Ini akan membuat semua tabel dan data awal.

4.  **Konfigurasi Koneksi:**
    * Buka file `e_learning/settings.py`.
    * Pastikan bagian `DATABASES` sudah benar, terutama `USER` dan `PASSWORD` MySQL Anda:
        ```python
        DATABASES = {
            'default': {
                'ENGINE': 'django.db.backends.mysql',
                'NAME': 'e-learning',  
                'USER': 'root',       # Ganti jika perlu
                'PASSWORD': '',        # Ganti jika perlu
                'HOST': '127.0.0.1',
                'PORT': '3306',
            }
        }
        ```
    * Pastikan file `e_learning/__init__.py` berisi kode ini agar `PyMySQL` dapat digunakan oleh Django:
        ```python
        import pymysql
        pymysql.install_as_MySQLdb()
        ```

### 3. Menjalankan Proyek

1.  **Jalankan Server:**
    Setelah semua instalasi dan konfigurasi selesai, jalankan server pengembangan Django:
    ```bash
    python manage.py runserver
    ```

2.  **Buka Aplikasi:**
    Buka browser Anda dan kunjungi alamat `http://127.0.0.1:8000/`.

## Akun Demo (dari `e-learning (1).sql`)

* **Dosen:** `dosenA@example.com` / `12345`
* **Mahasiswa:** `mhsA@example.com` / `12345`

## Tim Pengembang
|PROFIL |NAMA | NIM |
|-|-------|--------|
| [<img src="https://avatars.githubusercontent.com/u/115269741?v=4" width="50"/>](https://github.com/kevidn) |**Kevin Dzaky Hendratama** | 24111814055 |
| [<img src="https://avatars.githubusercontent.com/u/189943411?v=4" width="50"/>](https://github.com/AmelanovDestyawanda) |**Amelanov Destyawanda** | 24111814092 |
| [<img src="https://avatars.githubusercontent.com/u/189825677?v=4" width="50"/>](https://github.com/Apissr) |**Muhammad Hafizh Shafa** | 24111814053 |
