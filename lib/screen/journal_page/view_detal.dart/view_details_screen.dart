import 'package:flutter/material.dart';

class ViewDetailScreen extends StatelessWidget {
  final String journal;
  const ViewDetailScreen({super.key, required this.journal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('View Details',style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: Text(journal,style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
