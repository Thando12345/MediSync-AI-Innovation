from django import forms
from .models import Health
from django.utils.translation import gettext_lazy as _

class HealthForm(forms.ModelForm):
    class Meta:
        model = Health
        fields = ['patient_id', 'patient_name', 'age', 'sex', 'reason_for_visit','image']

    def __init__(self, *args, **kwargs):
        self.language = kwargs.pop('language', None)
        super().__init__(*args, **kwargs)

self.fields['patient_id'].label = _('Patient ID')
self.fields['patient_name'].label = _('Patient Name')
self.fields['age'].label = _('Age')
self.fields['sex'].label = _('Sex')
self.fields['reason_for_visit'].label = _('Reason for Visit')
self.fields['image'].label = _('Image')






class InputForm(forms.Form):
    patient_id = forms.CharField(label='Patient ID', max_length=100)
    patient_name = forms.CharField(label='Patient Name', max_length=100)
    age = forms.IntegerField(label='Age')
    sex = forms.CharField(label='Sex', max_length=100)
    reason_for_visit = forms.CharField(label='Reason for visit', max_length=100)
    image = forms.ImageField(label='Image')