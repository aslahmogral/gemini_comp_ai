import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/service/api-integration/post_create_user.dart';

class TodayScreenModel with ChangeNotifier {
  List<dynamic> dailyData = [];

  TodayScreenModel() {
    getDailyData();
  }

  getDailyData() async {
    dailyData = await getDaily();
    print(dailyData);
  }
}
