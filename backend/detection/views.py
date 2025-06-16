from rest_framework.views import APIView
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.response import Response
from rest_framework import status
from .models import LeafImage
from .serializers import LeafImageSerializer
from django.core.files.base import ContentFile
import base64

class DetectDiseaseView(APIView):
    parser_classes = (MultiPartParser, FormParser)

    def post(self, request, *args, **kwargs):
        # Handle file upload
        if 'image' in request.FILES:
            image_file = request.FILES['image']
            leaf_image = LeafImage(image=image_file)
            leaf_image.save()
            
            # Make prediction
            prediction, confidence = leaf_image.predict()
            
            serializer = LeafImageSerializer(leaf_image)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        
        # Handle base64 encoded image
        elif 'image_base64' in request.data:
            try:
                image_data = request.data['image_base64']
                format, imgstr = image_data.split(';base64,')
                ext = format.split('/')[-1]
                
                data = ContentFile(base64.b64decode(imgstr), name=f'temp.{ext}')
                
                leaf_image = LeafImage(image=data)
                leaf_image.save()
                
                # Make prediction
                prediction, confidence = leaf_image.predict()
                
                serializer = LeafImageSerializer(leaf_image)
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            except Exception as e:
                return Response({'error': str(e)}, status=status.HTTP_400_BAD_REQUEST)
        
        return Response({'error': 'No image provided'}, status=status.HTTP_400_BAD_REQUEST)

class PredictionHistoryView(APIView):
    def get(self, request, *args, **kwargs):
        images = LeafImage.objects.all().order_by('-uploaded_at')
        serializer = LeafImageSerializer(images, many=True)
        return Response(serializer.data)