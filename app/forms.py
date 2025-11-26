from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model

User = get_user_model()

class SignUpForm(UserCreationForm):
    email = forms.EmailField(required=True, widget=forms.EmailInput(attrs={
        'class': 'w-full pl-10 pr-4 py-3 rounded-lg border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-200',
        'placeholder': 'Email address'
    }))

    role = forms.ChoiceField(choices=[
        ('mahasiswa', 'Mahasiswa'),
        ('dosen', 'Dosen')
    ], widget=forms.Select(attrs={
        'class': 'w-full pl-10 pr-4 py-3 rounded-lg border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-200 bg-white'
    }))

    class Meta(UserCreationForm.Meta):
        model = User
        fields = ('username', 'email', 'role')

    def __init__(self, *args, **kwargs):
        super(SignUpForm, self).__init__(*args, **kwargs)
        # Styling untuk username
        self.fields['username'].widget.attrs.update({
            'class': 'w-full pl-10 pr-4 py-3 rounded-lg border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-200',
            'placeholder': 'Username'
        })
        # Styling untuk password 1 & 2 bawaan Django
        # Karena UserCreationForm punya field password otomatis, kita inject class CSS-nya disini
        for field in self.fields:
            if 'password' in field:
                self.fields[field].widget.attrs.update({
                    'class': 'w-full pl-10 pr-4 py-3 rounded-lg border border-gray-200 focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-200',
                    'placeholder': 'Password'
                })