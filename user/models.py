from django.db import models


# Create your models here.
class User(models.Model):
    name = models.CharField(max_length=30)
    password = models.CharField(max_length=10)
    username = models.CharField(max_length=30,unique=True)
    address = models.CharField(max_length=250)
    email = models.EmailField(max_length=30)
    date = models.CharField(max_length=10)
    phone = models.BigIntegerField()


class Disease(models.Model):
    user=models.CharField(max_length=30)
    plant_name = models.CharField(max_length=50)
    image = models.ImageField()
    admin = models.BooleanField(default=False)
    client = models.BooleanField(default=False)
    plant_disease=models.CharField(default="",max_length=255)
    fertilizer=models.CharField(default="",max_length=50)
