import 'package:flutter/material.dart';
import 'package:LeafDetect/chatbot/models_model.dart';
import 'package:LeafDetect/services/api_service.dart';

class ModelsProvider with ChangeNotifier {
  String _currentModel = "deepseek/deepseek-r1:free";

  String get currentModel => _currentModel;

  void setCurrentModel(String newModel) {
    _currentModel = newModel;
    notifyListeners();
  }

  List<ModelsModel> _modelsList = [];

  List<ModelsModel> get modelsList => _modelsList;

  Future<List<ModelsModel>> getAllModels() async {
    _modelsList = await ApiService.getModels();
    notifyListeners();
    return _modelsList;
  }
}
