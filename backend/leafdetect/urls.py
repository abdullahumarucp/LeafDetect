from django.contrib import admin
from django.urls import path
from detection.views import DetectDiseaseView, PredictionHistoryView
from django.conf import settings
from django.views.generic import TemplateView  
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/detect/', DetectDiseaseView.as_view(), name='detect-disease'),
    path('api/history/', PredictionHistoryView.as_view(), name='prediction-history'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)