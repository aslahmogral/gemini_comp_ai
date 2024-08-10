import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/constant/const_file.dart';
import 'package:gemini_comp_ai/screen/journal_page/view_detal.dart/view_details_screen.dart';

class JournalViewCard extends StatelessWidget {
  final String demoJournal;
  const JournalViewCard({super.key, required this.demoJournal});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        border: whiteBorder,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today Journal",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              InkWell(
                child: Image.asset("asset/image/arrow-right.png", width: 25),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewDetailScreen(journal: demoJournal)));
                },
              ),
            ],
          ),
          Divider(color: Colors.white),
          Text(
            demoJournal,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
