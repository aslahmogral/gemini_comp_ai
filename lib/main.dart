import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/screen/chat_screen.dart/chat_screen.dart';
import 'package:gemini_comp_ai/screen/home_screen/home_screen.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

void main() async {
  const String apiKey = 'AIzaSyANH2im6noAKtHhHRsPZmQdKrHzICkOtAI';
  if (apiKey.isEmpty) {
    throw Exception('API key is not set. Please obtain one from Google AI Studio.');
  }

  final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);

  runApp(MyApp(model: model));
}

class MyApp extends StatelessWidget {
  final GenerativeModel model;

  const MyApp({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.white,
        // textTheme: TextTheme(
        //   bodyText1: TextStyle(color: Colors.white),
        //   bodyText2: TextStyle(color: Colors.white),
        // ),
      ),
      home: HomeScreen(model: model),
    );
  }
}

