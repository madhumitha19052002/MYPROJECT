from tensorflow.keras.layers import Input, Lambda, Dense, Flatten
from tensorflow.keras.models import Model
from tensorflow.keras.applications.inception_v3 import InceptionV3
#from keras.applications.vgg16 import VGG16
from tensorflow.keras.preprocessing.image import ImageDataGenerator

from tensorflow.keras.models import load_model
from tensorflow.keras.applications.inception_v3 import preprocess_input
from tensorflow.keras.preprocessing import image
from tensorflow.keras.preprocessing.image import ImageDataGenerator,load_img
from tensorflow.keras.models import Sequential
import numpy as np
from glob import glob
from django.conf import settings


def Image_model():
    IMAGE_SIZE = [224, 224]

    train_path = settings.MEDIA_ROOT+'/'+'train'
    valid_path = settings.MEDIA_ROOT+'/'+'valid'

    inception = InceptionV3(input_shape=IMAGE_SIZE + [3], weights='imagenet', include_top=False)
    for layer in inception.layers:
        layer.trainable = False


    folders = glob(settings.MEDIA_ROOT+'/'+'train/*')
    x = Flatten()(inception.output)

    prediction = Dense(len(folders), activation='softmax')(x)

    model = Model(inputs=inception.input, outputs=prediction)
    model.summary()
    model.compile(
      loss='categorical_crossentropy',
      optimizer='adam',
      metrics=['accuracy']
    )


    train_datagen = ImageDataGenerator(rescale = 1./255,
                                       shear_range = 0.2,
                                       zoom_range = 0.2,
                                       horizontal_flip = True)

    test_datagen = ImageDataGenerator(rescale = 1./255)

    training_set = train_datagen.flow_from_directory(train_path,
                                                     target_size = (224, 224),
                                                     batch_size = 32,
                                                     class_mode = 'categorical')
    test_set = test_datagen.flow_from_directory(valid_path,
                                                target_size = (224, 224),
                                                batch_size = 32,
                                                class_mode = 'categorical')

    r = model.fit_generator(
      training_set,
      validation_data=test_set,
      epochs=10,
      steps_per_epoch=len(training_set),
      validation_steps=len(test_set)
    )


    model.save(settings.MEDIA_ROOT+'/'+'model_inception.h5')