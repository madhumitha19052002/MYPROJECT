from django.shortcuts import render,redirect,Http404,HttpResponse
from django.contrib import messages
import os
from django.conf import settings
from user.models import *
from .model_load import *
from django.core.mail import send_mail
from .image_train import Image_model
from .models import *
# Create your views here.
def home(request):
    return render(request,'index.html')

def about(request):
    return render(request,'about.html')

def contact(request):
    return render(request,'contact.html')
def contact_save(request):
    con=Contact()
    con.name=request.POST.get('name')
    con.subject=request.POST.get('subject')
    con.msg=request.POST.get('message')
    con.email=request.POST.get('email')
    con.save()
    send_mail('alazea','welcome to alazea , your request accepted successfully.',settings.DEFAULT_FROM_EMAIL, [request.POST.get('email')])
    messages.success(request,'thank you for contacting us')
    return redirect('/')

def admin_login(request):
    if request.method=='POST':
        email=str(request.POST.get('username'))
        pas=str(request.POST.get('pass'))
        if (email == 'admin') & (pas == '1234'):
            request.session['admin']='admin'
            return redirect('/admin.html')
    return render(request,'login.html',{'name':'admin'})

def admin_page(request):
    if "admin" in request.session:
        return render(request,'admin.html')
    else:
        return redirect('/admin_login.html')

def admin_logout(request):
    if 'admin' in request.session:
        request.session.pop('admin')
        messages.success(request,'logged out')
        return redirect('/')
    else:
        return redirect('/admin_login.html')

def downloader(request, path):
    file_path = os.path.join(settings.MEDIA_ROOT, path)
    if os.path.exists(file_path):
        with open(file_path, 'rb') as fh:
            response = HttpResponse(fh.read(), content_type="application/vnd.ms-excel")
            response['Content-Disposition'] = 'inline; filename=' + os.path.basename(file_path)
            return response
    raise Http404

def user_problems(request):
    if 'admin' in request.session:
        die=Disease.objects.filter(admin=False)
        return render(request,"user_problems.html",{"die":die})
    else:
        return redirect('/admin_login.html')

def problem_update(request,pk):
    if "admin" in request.session:
        a = model_predict(pk)
        die=Disease.objects.get(pk=pk)
        die.plant_disease=a
        die.save()
        return redirect('/user_problems.html')

def move_to_client(request,pk):
    if "admin" in request.session:
        die=Disease.objects.get(pk=pk)
        die.admin=True
        die.save()
        return redirect('/user_problems.html')

def modal_load(request):
    Image_model()
    messages.success(request,"model loaded successfully")
    return render(request,'admin.html')
