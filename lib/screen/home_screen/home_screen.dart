import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/constant/const_file.dart';
import 'package:gemini_comp_ai/main.dart';
import 'package:gemini_comp_ai/screen/chat_screen.dart/chat_screen.dart';
import 'package:gemini_comp_ai/screen/home_screen/home_screen_model.dart';
import 'package:gemini_comp_ai/screen/journal_page/today_journal/today_journal_page.dart';
import 'package:gemini_comp_ai/screen/profile_screen/profile_screen.dart';
import 'package:gemini_comp_ai/screen/voice_chat/voice_chat_screen.dart';
import 'package:gemini_comp_ai/widgets/bottom_sheet_selector.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final GenerativeModel model;

  const HomeScreen({super.key, required this.model});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    TodayJournalPage(),
    TodayJournalPage(),
    TodayJournalPage(),
    TodayJournalPage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      generativeModel = widget.model;
    });
  }

  AppBar appBarWidget() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        'Journal Ai',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        InkWell(
          onTap: () {
            bottomSheet(context: context, childWidget: ProfileScreen());
          },
          child: CircleAvatar(backgroundImage: AssetImage("asset/image/avatar.jpg")),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: Container(
          height: 40,
          margin: EdgeInsets.only(left: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                child: Container(
                  height: 40,
                  width: 120,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: _selectedIndex == 0 ? gradientBorder : whiteBorder,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Today Journal",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    border: _selectedIndex == 1 ? gradientBorder : whiteBorder,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Weekly Journal",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    border: _selectedIndex == 2 ? gradientBorder : whiteBorder,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Monthly Journal",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    border: _selectedIndex == 3 ? gradientBorder : whiteBorder,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Six Month Journal",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenModel>(
      create: (context) => HomeScreenModel(context),
      child: Consumer<HomeScreenModel>(
        builder: (context, model, child) => Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          backgroundColor: Colors.black,
          appBar: appBarWidget(),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          floatingActionButton: Container(
            width: MediaQuery.of(context).size.width / 2.2,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(10),
            decoration:
                BoxDecoration(border: whiteBorder, borderRadius: BorderRadius.circular(10), color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VoiceChatScreen(),
                      ),
                    );
                  },
                  icon: Image.asset("asset/image/assistant.png", width: 40),
                ),
                SizedBox(
                  height: 40,
                  child: VerticalDivider(color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(model: widget.model),
                      ),
                    );
                  },
                  icon: Image.asset("asset/image/ai.png", width: 40),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//  FloatingActionButton(
//                 elevation: 6,
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => VoiceChatScreen(),
//                     ),
//                   );
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //     builder: (context) => ChatScreen(model: widget.model),
//                   //   ),
//                   // );
//                 },
//               ),