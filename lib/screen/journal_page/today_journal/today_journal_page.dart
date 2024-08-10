import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/constant/const_file.dart';
import 'package:gemini_comp_ai/main.dart';
import 'package:gemini_comp_ai/screen/splash_screen/splash_screen.dart';
import 'package:gemini_comp_ai/service/api-integration/get_todays_journal.dart';
import 'package:gemini_comp_ai/widgets/journal_view_card.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class TodayJournalPage extends StatefulWidget {
  const TodayJournalPage({super.key});

  @override
  State<TodayJournalPage> createState() => _TodayJournalPageState();
}

class _TodayJournalPageState extends State<TodayJournalPage> {
  List<dynamic> todayJournal = [];

  bool loading = false;

  @override
  void initState() {
    super.initState();
    getTodayJournalListResponse();
  }

  Future<void> createJournal(String message) async {
    final prompt = [
      Content.text(message),
      Content.text("Create todays life journal using this context (content)"),
    ];
    try {
      final response = await generativeModel!.generateContent(prompt);
      String journal1 = response.text!.replaceAll(RegExp(r'\s+'), ' ');
      String journal2 = journal1.replaceAll('*', ' '); // Replaces all '*' with a space
      String journal3 = journal2.replaceAll('*#', ' '); // Replaces all '*#' with a space
      String journal4 = journal3.replaceAll(RegExp(r'[\[\]]'), ' '); // Replaces '[' and ']' with a space
      String journal5 = journal4.replaceAll('-', ' '); // Replaces all '-' with a space
      String journal6 = journal5.replaceAll('Date', ' ');
      String journal7 = journal6.replaceAll(RegExp(r'[{}]'), ' ');
      todayJournal.add({'role': 'assistant', 'content': journal7});
    } catch (error) {
      print('Error generating response: $error');
    }
  }

  Future<void> getTodayJournalListResponse() async {
    setState(() {
      loading = true;
    });
    final response = await getTodayJournalList(userId: localUserId!);
    if (response.isSuccessful == true) {
      for (final item in response.data!) {
        String contextThred = item["contextThred"].replaceAll(RegExp(r'\s+'), ' ');
        await createJournal(contextThred);
      }
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? CircularProgressIndicator()
        : SingleChildScrollView(
            child: Column(
              children: List.generate(
                todayJournal.length,
                (index) {
                  return JournalViewCard(demoJournal: todayJournal[index].toString());
                },
              ),
            ),
          );
    // : ListView.builder(

    //     itemCount: 1,
    //     shrinkWrap: true,
    //     itemBuilder: (context, index) {
    //       return JournalViewCard(
    //         demoJournal: demoJournal,
    //       );
    //     },
    //   );
  }
}
