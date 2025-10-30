from django.db import models

class Role(models.Model):
    role_id = models.AutoField(primary_key=True)
    role_name = models.CharField(max_length=50)

    class Meta:
        managed = False  # Beritahu Django tabel ini sudah ada
        db_table = 'roles'

    def __str__(self):
        return self.role_name


class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    email = models.CharField(unique=True, max_length=100)
    password = models.CharField(max_length=255)
    role = models.ForeignKey(Role, models.DO_NOTHING, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'users'

    def __str__(self):
        return self.name


class Course(models.Model):
    course_id = models.AutoField(primary_key=True)
    course_name = models.CharField(max_length=150)
    description = models.TextField(blank=True, null=True)
    lecturer = models.ForeignKey(User, models.DO_NOTHING, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'courses'

    def __str__(self):
        return self.course_name


class Assignment(models.Model):
    assignment_id = models.AutoField(primary_key=True)
    course = models.ForeignKey(Course, models.DO_NOTHING, blank=True, null=True)
    title = models.CharField(max_length=150)
    description = models.TextField(blank=True, null=True)
    deadline = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'assignments'

    def __str__(self):
        return self.title


class Discussion(models.Model):
    discussion_id = models.AutoField(primary_key=True)
    course = models.ForeignKey(Course, models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(User, models.DO_NOTHING, blank=True, null=True)
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'discussions'


class Enrollment(models.Model):
    enrollment_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, models.DO_NOTHING, blank=True, null=True)
    course = models.ForeignKey(Course, models.DO_NOTHING, blank=True, null=True)
    enrolled_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'enrollments'


class Quiz(models.Model):
    quiz_id = models.AutoField(primary_key=True)
    course = models.ForeignKey(Course, models.DO_NOTHING, blank=True, null=True)
    title = models.CharField(max_length=150)
    description = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'quizzes'

    def __str__(self):
        return self.title


class Grade(models.Model):
    grade_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, models.DO_NOTHING, blank=True, null=True)
    course = models.ForeignKey(Course, models.DO_NOTHING, blank=True, null=True)
    assignment = models.ForeignKey(Assignment, models.DO_NOTHING, blank=True, null=True)
    quiz = models.ForeignKey(Quiz, models.DO_NOTHING, blank=True, null=True)
    score = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'grades'


class Message(models.Model):
    message_id = models.AutoField(primary_key=True)
    sender = models.ForeignKey(User, models.DO_NOTHING, related_name='sent_messages', blank=True, null=True)
    receiver = models.ForeignKey(User, models.DO_NOTHING, related_name='received_messages', blank=True, null=True)
    message_text = models.TextField()
    sent_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'messages'


class Module(models.Model):
    module_id = models.AutoField(primary_key=True)
    course = models.ForeignKey(Course, models.DO_NOTHING, blank=True, null=True)
    title = models.CharField(max_length=150)
    content = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'modules'

    def __str__(self):
        return self.title


class Question(models.Model):
    question_id = models.AutoField(primary_key=True)
    quiz = models.ForeignKey(Quiz, models.DO_NOTHING, blank=True, null=True)
    question_text = models.TextField()
    option_a = models.CharField(max_length=255, blank=True, null=True)
    option_b = models.CharField(max_length=255, blank=True, null=True)
    option_c = models.CharField(max_length=255, blank=True, null=True)
    option_d = models.CharField(max_length=255, blank=True, null=True)
    correct_answer = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'questions'


class Submission(models.Model):
    submission_id = models.AutoField(primary_key=True)
    assignment = models.ForeignKey(Assignment, models.DO_NOTHING, blank=True, null=True)
    student = models.ForeignKey(User, models.DO_NOTHING, blank=True, null=True)
    answer_text = models.TextField(blank=True, null=True)
    file_url = models.CharField(max_length=255, blank=True, null=True)
    submitted_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'submissions'