import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env"); // 반드시 dotenv 초기화
  runApp(const MyApp());
}

