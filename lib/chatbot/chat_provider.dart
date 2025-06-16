import 'package:flutter/material.dart';
import 'package:LeafDetect/chatbot/chat_model.dart';
import 'package:LeafDetect/services/api_service.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> _chatList = [];
  bool _isLoading = false;

  List<ChatModel> get getChatList => _chatList;
  bool get isLoading => _isLoading;

  // Add user message
  void addUserMessage({required String msg}) {
    _chatList.add(ChatModel(msg: msg, chatIndex: 0));
    _scheduleNotifyListeners();
  }

  // Add bot message
  void addBotMessage({required String msg}) {
    _chatList.add(ChatModel(msg: msg, chatIndex: 1));
    _scheduleNotifyListeners();
  }

  // Send message to Gemini API
  Future<void> sendMessageAndGetAnswers({
    required String msg,
    required String chosenModelId,
  }) async {
    try {
      _isLoading = true;
      _scheduleNotifyListeners();
      
      addUserMessage(msg: msg);

      final responses = await ApiService.sendMessage(
        message: msg,
        modelId: chosenModelId,
      );

      for (var response in responses) {
        addBotMessage(msg: response.msg);
      }
    } catch (error) {
      addBotMessage(
        msg: "Sorry, I couldn't process your request. Please try again.",
      );
      debugPrint('Chat error: $error');
    } finally {
      _isLoading = false;
      _scheduleNotifyListeners();
    }
  }

  // Clear chat history
  Future<void> clearChatHistory() async {
    _chatList.clear();
    _isLoading = false;
    _scheduleNotifyListeners();
  }

  // Helper method to safely notify listeners
  void _scheduleNotifyListeners() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}