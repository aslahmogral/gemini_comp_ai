import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/screen/home_screen/home_screen.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

void main() {
  final apiKey = Platform.environment['AIzaSyANH2im6noAKtHhHRsPZmQdKrHzICkOtAI'];
  if (apiKey == null) {
    throw Exception('AIzaSyANH2im6noAKtHhHRsPZmQdKrHzICkOtAI is not set');
  }
  final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
