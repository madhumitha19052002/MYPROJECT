from django.db import models

# Create your models here
class Soil_Report(models.Model):
    name=models.CharField(max_length=50)
    month=models.CharField(max_length=30)
    product=models.CharField(max_length=30)

class Contact(models.Model):
    name=models.CharField(max_length=50)
    email=models.CharField(max_length=50)
    subject=models.CharField(max_length=50)
    msg=models.CharField(max_length=255)