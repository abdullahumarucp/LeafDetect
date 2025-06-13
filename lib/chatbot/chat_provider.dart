import 'package:LeafDetect/services/api_service.dart';
import 'package:flutter/material.dart';
import 'chat_model.dart';



class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];
  List<ChatModel> get getChatList => chatList;

  void addUserMessage({required String msg}) {
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers({
    required String msg,
    required String chosenModelId,
  }) async {
   //addUserMessage(msg: msg); // Add user's message first

    // Build message history for the API
    List<Map<String, String>> messageHistory = chatList.map((chat) {
      return {
        "role": chat.chatIndex == 0 ? "user" : "assistant",
        "content": chat.msg,
      };
    }).toList();

    //messageHistory.add({"role": "user", "content": msg});

    try {
      final responses = await ApiService.sendMessage(
        messageHistory: messageHistory,
        modelId: chosenModelId,
      );

     // chatList.add(ChatModel(msg: msg, chatIndex: 0));
      chatList.addAll(responses); // Add assistant response(s)
      notifyListeners();
    } catch (e) {
      chatList.add(ChatModel(msg: "⚠️ Error: ${e.toString()}", chatIndex: 1));
      notifyListeners();
    }
  }
}















// import 'package:LeafDetect/services/api_service.dart';
// import 'package:flutter/material.dart';
// import 'chat_model.dart';

// class ChatProvider with ChangeNotifier {
//   List<ChatModel> chatList = [];
//   List<ChatModel> get getChatList => chatList;
//     final List<Map<String, String>> _messageHistory = [];


//   void addUserMessage({required String msg}) {
//     chatList.add(ChatModel(msg: msg, chatIndex: 0));
//     _messageHistory.add({"role": "user", "content": msg});
//     notifyListeners();
//   }

//   Future<void> sendMessageAndGetAnswers(
//       {required String msg, required String chosenModelId}) async {
//     chatList.addAll(await ApiService.sendMessage(
//       message: msg,
//       modelId: chosenModelId,
//     ));
//     notifyListeners();
//   }
// }
