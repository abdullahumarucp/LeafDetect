import 'dart:math';

import 'package:flutter/material.dart';
import 'package:LeafDetect/chatbot/chat_model.dart';
import 'package:LeafDetect/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ChatProvider with ChangeNotifier {
  List<ChatModel> _chatList = [];

  List<ChatModel> get getChatList => _chatList;

  // Load chat history from SharedPreferences
  Future<void> loadChatHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? chatJsonList = prefs.getStringList('chat_history');
    print("Loaded history: ${chatJsonList?.length ?? 0}");
    if (chatJsonList != null) {
      _chatList = chatJsonList
          .map((jsonStr) => ChatModel.fromJson(jsonDecode(jsonStr)))
          .toList();
      notifyListeners();
    }
  }

  // Save chat history to SharedPreferences
  Future<void> saveChatHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> chatJsonList =
        _chatList.map((chat) => jsonEncode(chat.toJson())).toList();
    await prefs.setStringList('chat_history', chatJsonList);
  }

  // Add user message and save
  void addUserMessage({required String msg}) {
    _chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
    saveChatHistory();
  }

  // Add bot message and save
  void addBotMessage({required String msg}) {
    _chatList.add(ChatModel(msg: msg, chatIndex: 1));
    notifyListeners();
    saveChatHistory();
  }

  // Send message to Gemini API and store both sides
  Future<void> sendMessageAndGetAnswers({
    required String msg,
    required String chosenModelId,
  }) async {
    try {
      if (_chatList.isEmpty ||
          _chatList.last.msg != msg ||
          _chatList.last.chatIndex != 0) {
        addUserMessage(msg: msg);
      }

      // Prepare message history
      final messageHistory = _chatList.map((chat) {
        return {
          'role': chat.chatIndex == 0 ? 'user' : 'assistant',
          'content': chat.msg,
        };
      }).toList();

      // Add the new user message

      final responses = await ApiService.sendMessage(
        messageHistory: messageHistory,
        modelId: chosenModelId,
      );

      for (var response in responses) {
        addBotMessage(msg: response.msg);
      }
    } catch (error) {
      addBotMessage(msg: "Sorry, I encountered an error: $error");
      rethrow;
    }
  }

  // Clear chat and remove from storage
}













// import 'package:flutter/material.dart';
// import 'package:LeafDetect/chatbot/chat_model.dart';
// import 'package:LeafDetect/services/api_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// class ChatProvider with ChangeNotifier {
//   List<ChatModel> _chatList = [];

//   List<ChatModel> get getChatList => _chatList;

//   void addUserMessage({required String msg}) {
//     _chatList.add(ChatModel(msg: msg, chatIndex: 0));
//     notifyListeners();
//   }

//   void addBotMessage({required String msg}) {
//     _chatList.add(ChatModel(msg: msg, chatIndex: 1));
//     notifyListeners();
//   }

//   Future<void> sendMessageAndGetAnswers({
//     required String msg,
//     required String chosenModelId,
//   }) async {
//     try {
//       // Prepare message history
//       final messageHistory = _chatList.map((chat) {
//         return {
//           'role': chat.chatIndex == 0 ? 'user' : 'assistant',
//           'content': chat.msg,
//         };
//       }).toList();

//       // Add the new user message
//       messageHistory.add({'role': 'user', 'content': msg});

//       final responses = await ApiService.sendMessage(
//         messageHistory: messageHistory,
//         modelId: chosenModelId,
//       );

//       for (var response in responses) {
//         addBotMessage(msg: response.msg);
//       }
//     } catch (error) {
//       addBotMessage(msg: "Sorry, I encountered an error: $error");
//       rethrow;
//     }
//   }

//   void clearChat() {
//     _chatList.clear();
//     notifyListeners();
//   }
// }