import 'package:LeafDetect/chatbot/models_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:LeafDetect/chatbot/chat_model.dart';
//import 'package:LeafDetect/constants/api_consts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class ApiService {
    static Future<List<ModelsModel>> getModels() async {
  await Future.delayed(const Duration(milliseconds: 300));
  return ModelsModel.defaultModels;
}
  static Future<List<ChatModel>> sendMessage({
    required List<Map<String, String>> messageHistory,
    required String modelId,
  }) async {
    try {
      // Initialize the model
      final model = GenerativeModel(
        model: modelId, // e.g., "gemini-1.5-flash"
        apiKey: dotenv.env['GEMINI_API_KEY']!, // From .env
      );

      // Convert message history to Gemini's format
      final List<Content> contents = [];
      for (final msg in messageHistory) {
        if (msg['role'] == 'user') {
          contents.add(Content.text(msg['content']!));
        } else {
          contents.add(Content.model([TextPart(msg['content']!)]));
        }
      }

      // Generate content with the full conversation history
      final response = await model.generateContent(
        contents, // Directly pass the List<Content>
        generationConfig: GenerationConfig(maxOutputTokens: 200),
      );

      return [
        ChatModel(
          msg: response.text?.trim() ?? "No response from Gemini",
          chatIndex: 1,
        ),
      ];
    } catch (error) {
      throw Exception("Failed to get Gemini response: $error");
    }
  }
}