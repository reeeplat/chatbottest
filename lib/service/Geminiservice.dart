import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final GenerativeModel _model;

  GeminiService(String apiKey)
      : _model = GenerativeModel(
          model: 'gemini-1.5‑flash',  // 또는 지원되는 최신 모델명
          apiKey: apiKey,
        );

  Future<String> sendPrompt(String prompt) async {
    final contents = [Content.text(prompt)];
    final response = await _model.generateContent(contents);
    return response.text ?? '';
  }
}