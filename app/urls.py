from django.urls import path
from . import views

urlpatterns = [
    # Auth
    path('', views.login_view, name='login_view'),
    path('logout/', views.logout_view, name='logout_view'),

    # Dashboard
    path('dashboard/dosen/', views.dosen_dashboard, name='dosen_dashboard'),
    path('dashboard/mahasiswa/', views.mahasiswa_dashboard, name='mahasiswa_dashboard'),

    # Modul Mahasiswa
    path('dashboard/mahasiswa/modul/<int:modul_id>/', views.detail_modul, name='detail_modul'),

    # Modul Dosen (CRUD)
    path('dashboard/dosen/modul/', views.list_modul, name='list_modul'),
    path('dashboard/dosen/modul/tambah/', views.tambah_modul, name='tambah_modul'),
    path('dashboard/dosen/modul/<int:modul_id>/detail/', views.detail_modul_dosen, name='detail_modul_dosen'),
    path('dashboard/dosen/modul/edit/<int:modul_id>/', views.edit_modul, name='edit_modul'),
    path('dashboard/dosen/modul/hapus/<int:modul_id>/', views.hapus_modul, name='hapus_modul'),

    # Konten Modul (AJAX)
    path('ajax/create-content/', views.create_content_ajax, name='create_content_ajax'),
    path('ajax/update-content/', views.update_content_ajax, name='update_content_ajax'),
    path('dashboard/dosen/konten/hapus/<int:content_id>/', views.hapus_konten, name='hapus_konten'),
    path('dashboard/dosen/konten/reorder/', views.reorder_konten, name='reorder_konten'),

    # Quiz (Attached to Content)
    path('ajax/create-quiz/', views.create_quiz_ajax, name='create_quiz_ajax'),
    path('ajax/get-quiz/<int:quiz_id>/', views.get_quiz_data, name='get_quiz_data'),
    path('ajax/update-quiz/', views.update_quiz_ajax, name='update_quiz_ajax'),
    path('dashboard/dosen/quiz/hapus/<int:quiz_id>/', views.hapus_quiz, name='hapus_quiz'),

    # Task (Attached to Module)
    path('ajax/create-task/', views.create_task_ajax, name='create_task_ajax'),
    path('ajax/get-task/<int:assignment_id>/', views.get_task_data, name='get_task_data'),
    path('ajax/update-task/', views.update_task_ajax, name='update_task_ajax'),
    path('ajax/delete-task/<int:assignment_id>/', views.delete_task_ajax, name='delete_task_ajax'),

    path('course/<int:course_id>/', views.course_detail, name='course_detail'),
    path('course/<int:course_id>/enroll/', views.enroll_course, name='enroll_course'),

    path('api/content/<int:content_id>/', views.content_detail_api, name='content_detail_api'),
]