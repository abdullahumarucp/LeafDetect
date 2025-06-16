from django.db import models

# Create your models here.
from django.db import models
from django.core.files.storage import FileSystemStorage
import os
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing import image
import numpy as np
from PIL import Image
import io

# Configure model paths
MODEL_PATH = 'models/leaf_disease_model.h5'  # Replace with your actual model path
LABELS = ['healthy', 'disease1', 'disease2', 'disease3']  # Replace with your actual class labels

# Custom storage to avoid renaming files
class OverwriteStorage(FileSystemStorage):
    def get_available_name(self, name, max_length=None):
        if self.exists(name):
            os.remove(os.path.join(self.location, name))
        return name

# Disease model loader
class DiseaseDetector:
    _instance = None

    def __init__(self):
        self.model = load_model(MODEL_PATH)

    @classmethod
    def get_instance(cls):
        if cls._instance is None:
            cls._instance = cls()
        return cls._instance

    def predict_image(self, img):
        img = img.resize((224, 224))  # Adjust based on your model's expected input
        img_array = image.img_to_array(img)
        img_array = np.expand_dims(img_array, axis=0)
        img_array /= 255.0  # Normalize if your model expects this

        predictions = self.model.predict(img_array)
        predicted_class = LABELS[np.argmax(predictions[0])]
        confidence = float(np.max(predictions[0]))
        
        return predicted_class, confidence

# Image model
class LeafImage(models.Model):
    image = models.ImageField(upload_to='uploads/', storage=OverwriteStorage())
    uploaded_at = models.DateTimeField(auto_now_add=True)
    prediction = models.CharField(max_length=100, blank=True)
    confidence = models.FloatField(null=True, blank=True)

    def predict(self):
        try:
            detector = DiseaseDetector.get_instance()
            img = Image.open(self.image)
            prediction, confidence = detector.predict_image(img)
            self.prediction = prediction
            self.confidence = confidence
            self.save()
            return prediction, confidence
        except Exception as e:
            print(f"Prediction error: {e}")
            return None, None

    def __str__(self):
        return f"Image {self.id} - {self.prediction or 'Not predicted'}"