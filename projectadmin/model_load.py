from __future__ import division, print_function
import numpy as np
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing import image
from django.conf import settings
from user.models import *

MODEL_PATH = settings.MEDIA_ROOT+'/'+'model_inception.h5'

model = load_model(MODEL_PATH)
a = ['Apple___Apple_scab', 'Apple___Black_rot', 'Apple___Cedar_apple_rust', 'Apple___healthy', 'Blueberry___healthy',
     'Cherry_(including_sour)___Powdery_mildew', 'Cherry_(including_sour)___healthy',
     'Corn_(maize)___Cercospora_leaf_spot Gray_leaf_spot',
     'Corn_(maize)___Common_rust_', 'Corn_(maize)___Northern_Leaf_Blight', 'Corn_(maize)___healthy',
     'Grape___Black_rot', 'Grape___Esca_(Black_Measles)',
     'Grape___Leaf_blight_(Isariopsis_Leaf_Spot)', 'Grape___healthy', 'Orange___Haunglongbing_(Citrus_greening)',
     'Peach___Bacterial_spot',
     'Peach___healthy', 'Pepper,_bell___Bacterial_spot', 'Pepper,_bell___healthy', 'Potato___Early_blight',
     'Potato___Late_blight', 'Potato___healthy',
     'Raspberry___healthy', 'Soybean___healthy', 'Squash___Powdery_mildew', 'Strawberry___Leaf_scorch',
     'Strawberry___healthy', 'Tomato___Bacterial_spot',
     'Tomato___Early_blight', 'Tomato___Late_blight', 'Tomato___Leaf_Mold', 'Tomato___Septoria_leaf_spot',
     'Tomato___Spider_mites Two-spotted_spider_mite',
     'Tomato___Target_Spot', 'Tomato___Tomato_Yellow_Leaf_Curl_Virus', 'Tomato___Tomato_mosaic_virus',
     'Tomato___healthy']

def model_predict(pk, model=model):
    die = Disease.objects.get(pk=pk)
    img_path=settings.MEDIA_ROOT+'/'+str(die.image)

    print(img_path)
    img = image.load_img(img_path, target_size=(224, 224))

    x = image.img_to_array(img)
    x = x / 255
    x = np.expand_dims(x, axis=0)
    preds = model.predict(x)
    preds = np.argmax(preds, axis=1)
    print(a[int(preds)])
    return a[int(preds)]