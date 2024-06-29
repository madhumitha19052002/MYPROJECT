from django.db import models


# Create your models here.
class Client(models.Model):
    name = models.CharField(max_length=30)
    password = models.CharField(max_length=10)
    username = models.CharField(max_length=30,unique=True)
    address = models.CharField(max_length=250)
    email = models.EmailField(max_length=30)
    date = models.CharField(max_length=10)
    phone = models.BigIntegerField()
from django.db import models

# Create your models here.
class New(models.Model):
    disease=models.CharField(max_length=50)
    solutions=models.CharField(max_length=50)