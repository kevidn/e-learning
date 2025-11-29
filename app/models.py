from django.db import models

# --- MODEL UTAMA (User, Role, Course) ---
class Role(models.Model):
    role_id = models.AutoField(primary_key=True)
    role_name = models.CharField(max_length=50)
    class Meta:
        managed = True
        db_table = 'roles'
    def __str__(self): return self.role_name

class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    email = models.CharField(unique=True, max_length=100)
    password = models.CharField(max_length=255)
    role = models.ForeignKey(Role, models.DO_NOTHING, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    class Meta:
        managed = True
        db_table = 'users'
    def __str__(self): return self.name

class Course(models.Model):
    course_id = models.AutoField(primary_key=True)
    course_name = models.CharField(max_length=150)
    description = models.TextField(blank=True, null=True)
    lecturer = models.ForeignKey(User, models.DO_NOTHING, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    class Meta:
        managed = True
        db_table = 'courses'
    def __str__(self): return self.course_name

# --- MODEL MODUL & KONTEN ---
class Module(models.Model):
    module_id = models.AutoField(primary_key=True)
    course = models.ForeignKey(Course, models.DO_NOTHING, blank=True, null=True)
    title = models.CharField(max_length=150)
    description = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    class Meta:
        managed = True
        db_table = 'modules'
    def __str__(self): return self.title

class ModuleContent(models.Model):
    content_id = models.AutoField(primary_key=True)
    module = models.ForeignKey(Module, models.CASCADE, related_name='contents')
    title = models.CharField(max_length=200)
    text_content = models.TextField(blank=True, null=True)
    video_url = models.CharField(max_length=255, blank=True, null=True)
    order = models.IntegerField(default=1)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = True
        db_table = 'module_contents'
        ordering = ['order']

    def __str__(self): return self.title
    
    # Helper untuk template
    def get_embed_url(self):
        if not self.video_url: 
            return ""
        
        video_id = ""
        
        # Cek format standar: youtube.com/watch?v=ID
        if "v=" in self.video_url:
            try:
                # Ambil string setelah 'v=' dan potong jika ada parameter lain (&)
                video_id = self.video_url.split('v=')[1].split('&')[0]
            except IndexError:
                return self.video_url
                
        # Cek format pendek: youtu.be/ID
        elif "youtu.be" in self.video_url:
            try:
                # Ambil bagian terakhir dari URL
                video_id = self.video_url.split('/')[-1].split('?')[0]
            except IndexError:
                return self.video_url
        
        # Jika video_id ditemukan, return format embed yang benar
        if video_id:
            return f"https://www.youtube.com/embed/{video_id}"
            
        return self.video_url

# --- PERUBAHAN DI SINI (Quiz & Question) ---
class Quiz(models.Model):
    quiz_id = models.AutoField(primary_key=True)
    # Relasi OneToOne ke Content: Quiz menempel pada Content spesifik
    content = models.OneToOneField(ModuleContent, models.CASCADE, related_name='quiz') 
    title = models.CharField(max_length=150)
    description = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        managed = True
        db_table = 'quizzes'

class Question(models.Model):
    question_id = models.AutoField(primary_key=True)
    quiz = models.ForeignKey(Quiz, models.CASCADE, related_name='questions')
    question_text = models.TextField()
    option_a = models.CharField(max_length=255)
    option_b = models.CharField(max_length=255)
    option_c = models.CharField(max_length=255)
    option_d = models.CharField(max_length=255)
    # Menyimpan kunci jawaban (A, B, C, atau D)
    correct_answer = models.CharField(max_length=1) 
    
    class Meta:
        managed = True
        db_table = 'questions'

# --- PERUBAHAN DI SINI (Assignment) ---
class Assignment(models.Model):
    assignment_id = models.AutoField(primary_key=True)
    # Relasi ke Module (Bab Utama), bukan Course
    module = models.ForeignKey(Module, models.CASCADE, related_name='assignments')
    title = models.CharField(max_length=150)
    description = models.TextField(blank=True, null=True)
    deadline = models.DateTimeField(blank=True, null=True)
    
    class Meta:
        managed = True
        db_table = 'assignments'

class AssignmentFile(models.Model):
    file_id = models.AutoField(primary_key=True)
    assignment = models.ForeignKey(Assignment, models.CASCADE, related_name='files')
    file = models.FileField(upload_to='assignments/') 
    created_at = models.DateTimeField(auto_now_add=True)
    class Meta:
        managed = True
        db_table = 'assignment_files'

# --- MODEL PENDUKUNG (Managed=False) ---
class Submission(models.Model):
    submission_id = models.AutoField(primary_key=True)
    assignment = models.ForeignKey(Assignment, models.DO_NOTHING, blank=True, null=True)
    student = models.ForeignKey(User, models.DO_NOTHING, blank=True, null=True)
    answer_text = models.TextField(blank=True, null=True)
    file_url = models.CharField(max_length=255, blank=True, null=True)
    submitted_at = models.DateTimeField(auto_now_add=True)
    class Meta:
        managed = True
        db_table = 'submissions'

class Enrollment(models.Model):
    enrollment_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, models.DO_NOTHING, blank=True, null=True)
    course = models.ForeignKey(Course, models.DO_NOTHING, blank=True, null=True)
    enrolled_at = models.DateTimeField(auto_now_add=True)
    last_module = models.ForeignKey(Module, models.SET_NULL, blank=True, null=True, related_name='last_accessed_by')

    class Meta:
        managed = True
        db_table = 'enrollments'

class Grade(models.Model):
    grade_id = models.AutoField(primary_key=True)
    enrollment = models.ForeignKey(Enrollment, models.CASCADE, related_name='grades', blank=True, null=True)
    user = models.ForeignKey(User, models.DO_NOTHING, blank=True, null=True)
    course = models.ForeignKey(Course, models.DO_NOTHING, blank=True, null=True)
    assignment = models.ForeignKey(Assignment, models.DO_NOTHING, blank=True, null=True)
    quiz = models.ForeignKey(Quiz, models.DO_NOTHING, blank=True, null=True)
    score = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    feedback = models.TextField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'grades'


class Message(models.Model):
    message_id = models.AutoField(primary_key=True)
    sender = models.ForeignKey(User, models.DO_NOTHING, related_name='sent_messages', blank=True, null=True)
    receiver = models.ForeignKey(User, models.DO_NOTHING, related_name='received_messages', blank=True, null=True)
    message_text = models.TextField()
    sent_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = True
        db_table = 'messages'

class Discussion(models.Model):
    discussion_id = models.AutoField(primary_key=True)
    
    course = models.ForeignKey(Course, models.DO_NOTHING, related_name='discussions')
    
    user = models.ForeignKey(User, models.DO_NOTHING, related_name='discussions')
    
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = True 
        db_table = 'discussions'
        ordering = ['created_at'] 

    def __str__(self):
        sender_name = self.user.name if self.user else "Unknown"
        return f"{sender_name}: {self.message[:30]}..."