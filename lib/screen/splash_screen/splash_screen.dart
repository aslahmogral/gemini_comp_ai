import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? localUserId;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timerFunction();
  }

  Future timerFunction() async {
    SharedPreferences userLoginCredential = await SharedPreferences.getInstance();
    setState(() {
      localUserId = userLoginCredential.getString("userId");
    });
    Future.delayed(Duration(seconds: 3), () {
      if (localUserId != null) {
        Navigator.pushReplacementNamed(context, 'home_screen');
        // Navigator.pushReplacementNamed(context, 'create_account_screen');
      } else {
        Navigator.pushReplacementNamed(context, 'create_account_screen');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Image.asset("asset/image/app_logo.jpg"),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 120,
        child: Column(
          children: [
            Text('Powerd By', style: TextStyle(color: Colors.white)),
            Image.asset("asset/image/gemini.png", width: 80),
          ],
        ),
      ),
    );
  }
}
