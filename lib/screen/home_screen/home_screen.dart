import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/screen/chat_screen.dart/chat_screen.dart';
import 'package:gemini_comp_ai/screen/home_screen/home_screen_model.dart';
import 'package:gemini_comp_ai/screen/today_screen/today_screen.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final GenerativeModel model;

  const HomeScreen({super.key, required this.model});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenModel>(
        create: (context) => HomeScreenModel(context),
        child: Consumer<HomeScreenModel>(
            builder: (context, model, child) => Scaffold(
                  appBar: AppBar(
                    title: Text('AI Journal Partner'),
                    actions: [
                      IconButton(
                          onPressed: () {
                            model.logout();
                          },
                          icon: Icon(Icons.logout))
                    ],
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TodayScreen(),
                                  ));
                            },
                            child: Text('today')),
                        ElevatedButton(onPressed: () {}, child: Text('this week')),
                        ElevatedButton(onPressed: () {}, child: Text('this month')),
                        ElevatedButton(onPressed: () {}, child: Text('this year')),
                        ElevatedButton(onPressed: () {}, child: Text('all time')),
                      ],
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(model: widget.model),
                          ));
                    },
                    child: Icon(Icons.chat),
                  ),
                )));
  }
}
