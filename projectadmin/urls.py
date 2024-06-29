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
from django.urls import path
from projectadmin import views

urlpatterns = [
    path('', views.home, name='home'),
    path('about.html/', views.about, name='home'),
    path('admin_login.html/', views.admin_login, name='admin_login'),
    path('admin_logout.html/', views.admin_logout, name='admin_logout'),
    path('admin.html/', views.admin_page, name='admin_page'),
    path('user_problems.html/', views.user_problems, name='user_problems'),
    path('update_problems.html/<int:pk>', views.problem_update, name='update_problems'),
    path('move_to_client.html/<int:pk>', views.move_to_client, name='move_to_client'),
    path('model_load.html/', views.modal_load,name='model_load'),
    path('contact.html/', views.contact, name='contact'),
    path('contact_save.html/', views.contact_save, name='contact_save'),
]
