from django.shortcuts import render, redirect, Http404, HttpResponse
from django.contrib import messages
import os
from django.conf import settings
from .models import *
from user.models import *


# Create your views here.
def register(request):
        use=False
        if request.method == "POST":
            username = request.POST.get('username')
            try:
                use= Client.objects.get(username=username)
            except:
                pass
            if use is not False:
                messages.error(request, "username already exists")
                return redirect('/client_registration.html')
            else:
                user = Client()
                user.username = username
                user.name = request.POST.get('name')
                user.date = request.POST.get('dob')
                user.email = request.POST.get('email')
                user.password = request.POST.get('pass')
                user.phone = request.POST.get('phone')
                user.address = request.POST.get('address')
                user.save()
                messages.success(request, "registered successfully")
                return redirect('/client_login.html')
        return render(request, "register.html")

def login(request):
    if "user" in request.session:
        messages.success(request, 'already logged in')
        return redirect('/client.html')
    else:
        if request.method == 'POST':
            username = request.POST.get('username')
            password = request.POST.get('pass')
            print(1)
            try:
                user = Client.objects.get(username=username)
                if user.password != password:
                    print(12)
                    messages.success(request, 'password is wrong')
                    return redirect('/user_login.html')
                print(123)
                request.session['client'] = user.username
                return redirect('/client.html')
            except Client.DoesNotExist:
                print(133)
                messages.success(request, 'username does not exist')
                return redirect('/client_login.html')
        return render(request, "login.html", {'name': 'client'})

def page(request):
    if 'client' in request.session:
        return render(request,'client.html')
    else:
        return redirect('/client_login.html')

def choose(request):
    if 'client' in request.session:
        die=Disease.objects.filter(admin=True)
        return render(request, 'client_identify.html',{'die':die})
    else:
        return redirect('/client_login.html')


def logout(request):
    if 'client' in request.session:
        request.session.pop('client',None)
        messages.success(request,'logout already successfully')
        return redirect('/')
    else:
        messages.success(request, 'session loggedout')
        return redirect('/client_login.html')

def check(request,pk):
    if 'client' in request.session:
        die=Disease.objects.get(pk=pk)
        a=die.plant_disease
        dic = {'Apple___Apple_scab': "Bonide Captan", 'Apple___Black_rot': 'Sovran 50WG',
             'Apple___Cedar_apple_rust': 'Bonide Orchard Spray', 'Apple___healthy': 'apple is healthy',
             'Blueberry___healthy': 'blueberry is haalthy',
             'Cherry_(including_sour)___Powdery_mildew': 'Use sulfur-containing organic fungicides',
             'Cherry_(including_sour)___healthy': 'cherry is healthy',
             'Corn_(maize)___Cercospora_leaf_spot Gray_leaf_spot': 'picoxystrobin cyproconazole',
             'Corn_(maize)___Common_rust_': 'stratego yld',
             'Corn_(maize)___Northern_Leaf_Blight': 'famoxadone cymoxanil fungicide',
             'Corn_(maize)___healthy': 'Corn is healthy',
             'Grape___Black_rot': 'Sovran 50WG', 'Grape___Esca_(Black_Measles)': 'Copper Oxychloride',
             'Grape___Leaf_blight_(Isariopsis_Leaf_Spot)': 'Penthiopyrad', 'Grape___healthy': 'grape is healthy',
             'Orange___Haunglongbing_(Citrus_greening)': ' streptomycin and oxytetracycline',
             'Peach___Bacterial_spot': 'actigard 50wg',
             'Peach___healthy': 'Peach is healthy', 'Pepper,_bell___Bacterial_spot': 'Ammonium Lignosulfonate',
             'Pepper,_bell___healthy': 'pepper is healthy', 'Potato___Early_blight': 'Penthiopyrad',
             'Potato___Late_blight': 'famoxadone cymoxanil fungicide', 'Potato___healthy': 'potato is healthy',
             'Raspberry___healthy': 'Respberry is healthy', 'Soybean___healthy': 'Soybean is healthy',
             'Squash___Powdery_mildew': 'sulfur-containing organic fungicides',
             'Strawberry___Leaf_scorch': 'Potassium silicate and calcium silicate separately applied as soil treatment combined with foliar spray',
             'Strawberry___healthy': 'Strawberry is healthy', 'Tomato___Bacterial_spot': 'Azoxystrobin',
             'Tomato___Early_blight': 'Penthiopyrad', 'Tomato___Late_blight': 'famoxadone cymoxanil fungicide',
             'Tomato___Leaf_Mold':"chlorothalonil, maneb, mancozeb and copper formulations", 'Tomato___Septoria_leaf_spot':"Fungicides containing maneb, mancozeb, chlorothalonil",'Tomato___Spider_mites Two-spotted_spider_mite':'cymoxanil fungicide', 'Tomato___Target_Spot': 'cymoxanil fungicide', 'Tomato___Tomato_Yellow_Leaf_Curl_Virus': 'Venom Insecticide', 'Tomato___Tomato_mosaic_virus': 'cypermethrin',
        'Tomato___healthy': 'tomato is healthy'}
        print(a)
        die.fertilizer=dic[a]
        die.client=True
        die.save()
        return redirect("/user_problems_1.html")
    else:
        messages.success(request, 'session loggedout')
        return redirect('/client_login.html')
