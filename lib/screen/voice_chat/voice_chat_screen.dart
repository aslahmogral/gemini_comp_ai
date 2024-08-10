import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gemini_comp_ai/constant/const_file.dart';
import 'package:lottie/lottie.dart';

class VoiceChatScreen extends StatefulWidget {
  const VoiceChatScreen({super.key});

  @override
  State<VoiceChatScreen> createState() => _VoiceChatScreenState();
}

class _VoiceChatScreenState extends State<VoiceChatScreen> {
  FlutterTts flutterTts = FlutterTts();

  Future<void> configureTts() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(1.0);
    await flutterTts.setVolume(1.0);
  }

  void speakText(String text) async {
    await flutterTts.speak(text);
  }

  void stopSpeaking() async {
    await flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Ai Assistant", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Lottie.asset('asset/image/ai_assistant.json'),
          ),
        ],
      ),
      floatingActionButton: Image.asset("asset/image/voice.png", width: 60),
    );
  }
}
