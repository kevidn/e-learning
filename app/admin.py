from django.contrib import admin
from . import models

# Daftarkan semua model Anda di sini
admin.site.register(models.Role)
admin.site.register(models.User)
admin.site.register(models.Course)
admin.site.register(models.Assignment)
# admin.site.register(models.Discussion)
admin.site.register(models.Enrollment)
admin.site.register(models.Quiz)
admin.site.register(models.Grade)
admin.site.register(models.Message)
admin.site.register(models.Module)
admin.site.register(models.Question)
admin.site.register(models.Submission)
admin.site.register(models.AssignmentFile)
admin.site.register(models.ModuleContent)