import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:LeafDetect/chatbot/models_model.dart';
import 'package:LeafDetect/chatbot/chat_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return ModelsModel.defaultModels;
  }

  static Future<List<ChatModel>> sendMessage({
    required String message,  // Changed from messageHistory to just the message
    required String modelId,
  }) async {
    try {
      // Initialize the model
      final model = GenerativeModel(
        model: modelId, // e.g., "gemini-1.5-flash"
        apiKey: dotenv.env['GEMINI_API_KEY']!, // From .env
      );

      // Generate content with just the current message
      final response = await model.generateContent(
        [Content.text(message)], // Only pass the current message
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