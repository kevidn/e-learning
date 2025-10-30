from django.urls import path
from . import views

urlpatterns = [
    path('', views.login_view, name='login_view'),

    path('logout/', views.logout_view, name='logout_view'),
    path('dashboard/dosen/', views.dosen_dashboard, name='dosen_dashboard'),

    path('dashboard/mahasiswa/', views.mahasiswa_dashboard, name='mahasiswa_dashboard'),

    path('dashboard/mahasiswa/modul/<int:modul_id>/', views.detail_modul, name='detail_modul'),

    path('dashboard/dosen/modul/', views.list_modul, name='list_modul'),
    path('dashboard/dosen/modul/tambah/', views.tambah_modul, name='tambah_modul'),
    path('dashboard/dosen/modul/edit/<int:modul_id>/', views.edit_modul, name='edit_modul'),
    path('dashboard/dosen/modul/hapus/<int:modul_id>/', views.hapus_modul, name='hapus_modul'),
]