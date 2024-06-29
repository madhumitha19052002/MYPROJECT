from django.shortcuts import render, redirect, Http404, HttpResponse
from django.contrib import messages
import os
from django.conf import settings
from .models import *
from django.core.files.storage import FileSystemStorage
from .whether import weather as wea
from django.views import View
from .forms import soilforms
from .soil_test import soil as SoilTest

# Create your views here.
def register(request):
    if request.method == "POST":
        use = False
        username = request.POST.get('username')
        try:
            User.objects.get(username=username)
            use = True

        except User.DoesNotExist:
            pass
        if use:
            messages.error(request, "username already exists")
            return redirect('/user_registration.html')
        else:
            user = User()
            user.username = username
            user.name = request.POST.get('name')
            user.date = request.POST.get('dob')
            user.email = request.POST.get('email')
            user.password = request.POST.get('pass')
            user.phone = request.POST.get('phone')
            user.address = request.POST.get('address')
            user.save()
            messages.success(request, "registered successfully")
            return redirect('/user_login.html')
    return render(request, "register.html")


def login(request):
    if "user" in request.session:
        messages.success(request, 'already logged in')
        return redirect('/user_page.html')
    else:
        if request.method == 'POST':
            username = request.POST.get('username')
            password = request.POST.get('pass')
            print(0)
            try:
                user = User.objects.get(username=username)
                print(1)
                if user.password != password:
                    print(2)
                    messages.success(request, 'password is wrong')
                    return redirect('/user_login.html')
                request.session['user'] = user.username
                return redirect('/user.html')
            except User.DoesNotExist:
                messages.success(request, 'username does not exist')
                return redirect('/user_login.html')
        return render(request, "login.html", {'name': 'user'})


def page(request):
    if 'user' in request.session:
        return render(request, 'user.html')
    else:
        messages.success(request, 'session already loggedout')
        return redirect('/user_login.html')


def logout(request):
    if 'user' in request.session:
        request.session.pop('user', None)
        messages.success(request, 'logout already successfully')
        return redirect('/')
    else:
        messages.success(request, 'session loggedout')
        return redirect('/user_login.html')


def upload(request):
    if 'user' in request.session:
        if request.method == "POST":
            dis = Disease()
            dis.user = request.session['user']
            img = request.FILES['image']
            dis.plant_name = request.POST.get('username')
            dis.image = img
            dis.save()
        return render(request, 'asdf.html')
    else:
        messages.success(request, 'session loggedout')
        return redirect('/user_login.html')


def view(request):
    if 'user' in request.session:
        dis = Disease.objects.filter(user=request.session['user'])
        print(request.session['user'])
        return render(request, 'user_view.html', {'dis': dis})
    else:
        messages.success(request, 'session loggedout')
        return redirect('/user_login.html')


def weather(request):
    if 'user' in request.session:
        if request.method == "POST":
            city = request.POST.get('city')
            i, j, k, l = wea(city)

            return render(request, 'weather.html', {'i': i, 'j': j, "k": k, 'l': l})
        return render(request, 'weather.html')
    else:
        messages.success(request, 'session loggedout')
        return redirect('/user_login.html')


soil_rep = {
    'Alluvial': ['Tobacco', 'Cotton', 'Rice', 'Wheat', 'Bajra', 'Sorghum', 'Pea', 'Pigeon Pea', 'Chicpea', 'Black Gram',
                 'Green Gram', 'soybean', 'Groundnut', 'Mustard', 'Linseed', 'Sesame', 'Barley', 'Jute', 'Maize',
                 'any oilseeds', 'vegetables', 'fruits'],
    'Black': ['Rice', 'Sugarcane', 'Wheat', 'jowar', 'linseed', 'sunflower', 'ceral crops', 'citrus fruits',
              'vegetables', 'tobacco', 'groundnut', 'millets'],
    'red and yellow': ['Rice', 'Wheat', 'sugarcane', 'maize/corn', 'groundnut', 'ragi', 'potato', 'oilseeds', 'pulses',
                       'millets', 'mango', 'orange', 'citrus'],
    'Laterite': ['Cotton', 'Rice', 'wheat', 'puleses', 'Tea', 'Growing coffee', 'rubber', 'coconut', 'cashews'],
    'Arid': ['Wheat', 'cotton', 'corn', 'millets', 'pulses', 'barley'],
    'forest and mountain': ['Tea', 'Spices', 'Wheat', 'maize', 'barley', 'coffee', 'tropical fruits'],
    }


def soil(request):
    if 'user' in request.session:
        if request.method == "POST":
            soil = request.POST.get('soil')
            i = soil_rep[soil]
            return render(request, 'soil_1.html', {'i': i, 'soil': soil})
        return render(request, 'soil.html')
    else:
        messages.success(request, 'session loggedout')
        return redirect('/user_login.html')


class soil_(View):
    def get(self, request):
        forms = soilforms()
        return render(request, 'soil_.html', {'form': forms})

    def post(self, request):
        forms = soilforms(request.POST)
        if forms.is_valid():
            dic=dict(forms.cleaned_data)
            data=list(dic.values())
            data=SoilTest.prediction(data)
        return render(request, 'soil_.html', {'form': forms,"data":data})

def rec(request):
    return render(request,'rec.html')