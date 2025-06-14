import 'package:flutter/material.dart';
import 'package:LeafDetect/chatbot/models_model.dart';
import 'package:LeafDetect/services/api_service.dart';

class ModelsProvider with ChangeNotifier {
  String _currentModel = "gemini-1.5-flash";

  String get currentModel => _currentModel;

  void setCurrentModel(String newModel) {
    _currentModel = newModel;
    notifyListeners();
  }

  List<ModelsModel> _modelsList = ModelsModel.defaultModels;

  List<ModelsModel> get modelsList => _modelsList;

  Future<List<ModelsModel>> getAllModels() async {
    try {
      _modelsList = await ApiService.getModels();
      notifyListeners();
      return _modelsList;
    } catch (e) {
      // Fallback to default models if API fails
      _modelsList = ModelsModel.defaultModels;
      notifyListeners();
      return _modelsList;
    }
  }
}