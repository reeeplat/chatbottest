// lib/app.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:chatbot_test/presentation/viewmodel/chatbot_view.dart';
import 'presentation/screens/chatbot_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiKey = dotenv.env['GEMINI_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('❌ GEMINI_API_KEY not found in .env file');
    }

    return ChangeNotifierProvider(
      create: (_) => ChatbotViewModel(apiKey: apiKey),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChatbotScreen(),
      ),
    );
  }
}