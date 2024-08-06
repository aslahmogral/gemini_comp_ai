import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/json_model/journal_jsonmodel.dart';
import 'package:gemini_comp_ai/service/api-integration/get_journal.dart';

class TodayScreenModel with ChangeNotifier {
  bool loading = false;
  List<JournalJsonModel> dailyData = [];

  TodayScreenModel() {
    getDailyData();
  }

  getDailyData() async {
    loading = true;
    final response = await getTodayJournal();
    if (response.isSuccessful == true) {
      for (JournalJsonModel data in response.data!) {
        dailyData.add(data);
      }
    }
    loading = false;
    notifyListeners();
  }
}
