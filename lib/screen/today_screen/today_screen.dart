import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/screen/today_screen/today_screen_model.dart';
import 'package:provider/provider.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodayScreenModel>(
      create: (context) => TodayScreenModel(),
      child: Consumer<TodayScreenModel>(
        builder: (context, data, model) => Scaffold(
          appBar: AppBar(
            title: Text('today'),
          ),
          body: Center(
            child: Column(
              children: [
                // if (DataHub.dailyData[0].url != null)
                //   Image.network(
                //     model.dailyData[0].url!,
                //   );
                // else
                //   const Icon(Icons.image_not_supported_sharp),
                // Text(DataHub.dailyData[0].value!),
              ],
            ),
          ),
          floatingActionButton: SizedBox(
            // width: 200,
            child: FloatingActionButton.extended(
              onPressed: () {
                // data.updateDailyData();
              },
              label: Text('show daily record'),
            ),
          ),
        ),
      ),
    );
  }
}
