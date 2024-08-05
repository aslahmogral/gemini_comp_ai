import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/data_hub/data_hub.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('today'),
      ),
      body: Center(
        child: Column(
          children: [
            if (DataHub.dailyData[0].url != null)
              Image.network(
                DataHub.dailyData[0].url!,
              )
            else
              const Icon(Icons.image_not_supported_sharp),
            Text(DataHub.dailyData[0].value!),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        // width: 200,
        child: FloatingActionButton.extended(
          onPressed: (){},
          label: Text('show daily record'),
        ),
      ),
    );
  }
}
