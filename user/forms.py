from django import forms


class soilforms(forms.Form):
    carbon = forms.FloatField(widget=forms.NumberInput(
        attrs={'placeholder': 'carbon',  'title': 'Enter Carbon details'}))
    nitrogen = forms.FloatField(widget=forms.NumberInput(
        attrs={'placeholder': 'nitrogen',  'title': 'Enter nitrogen details'}))
    phosphorus = forms.FloatField(widget=forms.NumberInput(
        attrs={'placeholder': 'phosphorus',  'title': 'Enter phosphorus details'}))
    potassium = forms.FloatField(widget=forms.NumberInput(
        attrs={'placeholder': 'potassium',  'title': 'Enter potassium details'}))
    sulphur = forms.FloatField(widget=forms.NumberInput(
        attrs={'placeholder': 'sulphur',  'title': 'Enter sulphur details'}))
    zinc = forms.FloatField(widget=forms.NumberInput(
        attrs={'placeholder': 'zinc',  'title': 'Enter zinc details'}))
    iron = forms.FloatField(widget=forms.NumberInput(
        attrs={'placeholder': 'iron',  'title': 'Enter iron details'}))
    copper = forms.FloatField(widget=forms.NumberInput(
        attrs={'placeholder': 'copper',  'title': 'Enter copper details'}))
    manganese = forms.FloatField(widget=forms.NumberInput(
        attrs={'placeholder': 'manganese',  'title': 'Enter manganese details'}))
    salinity = forms.FloatField(widget=forms.NumberInput(
        attrs={'placeholder': 'salinity',  'title': 'Enter salinity details'}))
