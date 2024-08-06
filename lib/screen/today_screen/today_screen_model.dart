import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/data_hub/data_hub.dart';

class TodayScreenModel with ChangeNotifier{
  List<Data> dailyData = DataHub.dailyData;
}