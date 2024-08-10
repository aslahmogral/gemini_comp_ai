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
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('today'),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: model.loading
                  ? CircularProgressIndicator()
                  : Column(
                      children: List.generate(
                      model.dailyData.length,
                      (index) {
                        return ListTile(
                          leading: Text(model.dailyData[index].objectId),
                          title: Text(model.dailyData[index].journal),
                        );
                      },
                    )),
            ),
          ),
          floatingActionButton: SizedBox(
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
