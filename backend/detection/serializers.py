from rest_framework import serializers
from .models import LeafImage

class LeafImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = LeafImage
        fields = ['id', 'image', 'uploaded_at', 'prediction', 'confidence']
        read_only_fields = ['uploaded_at', 'prediction', 'confidence']