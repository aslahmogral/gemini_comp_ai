import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/screen/splash_screen/splash_screen.dart';
import 'package:gemini_comp_ai/service/api-integration/post_today_journal.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatScreen extends StatefulWidget {
  final GenerativeModel model;

  const ChatScreen({super.key, required this.model});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  Future<void> sendMessage(String message) async {
    _messageController.clear();
    setState(() {
      _messages.add({'role': 'user', 'content': message});
    });

    setState(() {
      answer = message;
    });

    final prompt = [
      Content.text(suggestion1),
      Content.text(suggestion2),
      Content.text(suggestion3),
      Content.text(answer ?? "sorry it's your time, please tell me the question"),
      Content.text(suggestion4),
      Content.text(suggestion5),
      if (history == null) Content.text(suggestion15),
      if (history != null) Content.text(suggestion15 + "please check $history"),
      Content.text(suggestion6),
      Content.text(history ?? "sorry no history? tell as a new"),
    ];
    try {
      final response = await widget.model.generateContent(prompt);
      setState(() {
        _messages.add({'role': 'assistant', 'content': response.text});
      });
      getAllMessagesAsString();
    } catch (error) {
      print('Error generating response: $error');
    }
  }

  String getAllMessagesAsString() {
    return _messages.map((message) => message['content'] as String).join('\n');
  }

  Future<void> createTodayJournalResponse() async {
    final response = await createTodayJournal(
        userId: localUserId!, contextThred: getAllMessagesAsString(), journal: getAllMessagesAsString());
    if (response.isSuccessful == true) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.message ?? "Failed")));
    }
  }

  String? history;
  String suggestion1 = "this is prompt";
  String suggestion2 = "i want record my life journal";
  String suggestion3 = "please send me questions my day life";
  String? answer;
  String suggestion4 = "i think you got an answer, please send next question";
  String suggestion5 =
      "questions should be short and one time one question only, then i will answer the question please send next question ok?";
  String suggestion15 = "you ask only questions, dont use greetings and don't you previouse question";
  String suggestion6 = "do you want prewiouse question and answer";

  @override
  void initState() {
    super.initState();
    sendMessage("");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        createTodayJournalResponse();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: const Text('Gen-AI Chat', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Align(
                    alignment: message['role'] == 'user' ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: message['role'] == 'user' ? Colors.grey[800] : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(message['content'],
                          style: TextStyle(color: message['role'] == 'user' ? Colors.white : Colors.black)),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Type your message',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      sendMessage(_messageController.text);
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
