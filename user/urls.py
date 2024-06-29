"""plant URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from user import views
urlpatterns = [
    path("user.html/",views.page,name='userpage'),
    path("user_login.html/", views.login, name='userlogin'),
    path("user_register.html/", views.register, name='userregister'),
    path("user_logout.html/", views.logout, name='userlogout'),
    path("user_upload.html/", views.upload, name='userupload'),
    path("user_view.html/", views.view, name='user_view'),
    path("weather.html/", views.weather, name='weather'),
    path("soil.html/", views.soil, name='soil'),
    path("rec.html/", views.rec, name='rec'),
    path("soil_test.html/", views.soil_.as_view(), name='soil_test'),

]
