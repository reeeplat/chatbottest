import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatbotScreen(),
    );
  }
}

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meditooth 챗봇')),
      body: const Center(
        child: Text(
          '여기에 챗봇 UI가 들어갑니다.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

