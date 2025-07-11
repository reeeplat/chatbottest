import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

class ChatbotViewModel extends ChangeNotifier {
  final GenerativeModel _model;

  ChatbotViewModel({required String apiKey})
      : _model = GenerativeModel(
          model: 'gemini-1.5-flash',
          apiKey: apiKey,
          generationConfig: GenerationConfig(maxOutputTokens: 200),
        );

  final List<ChatMessage> _messages = [];

  List<ChatMessage> get messages => List.unmodifiable(_messages);

  Future<void> sendMessage(String message) async {
    _messages.add(ChatMessage(role: 'user', content: message));
    notifyListeners();

    try {
      final contents = [Content.text(message)];
      final response = await _model.generateContent(contents);
      final botText = response.text ?? '응답이 없습니다.';
      _messages.add(ChatMessage(role: 'bot', content: botText));
    } catch (e) {
      if (kDebugMode) {
        print('Gemini 호출 오류: $e');
      }
      _messages.add(ChatMessage(role: 'bot', content: 'AI 호출 중 오류가 발생했습니다.'));
    } finally {
      notifyListeners();
    }
  }
}

class ChatMessage {
  final String role;
  final String content;

  ChatMessage({required this.role, required this.content});
}
