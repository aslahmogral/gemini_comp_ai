import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  String? userId;

  Future timerFunction() async {
    SharedPreferences userLoginCredential = await SharedPreferences.getInstance();
    setState(() {
      userId= userLoginCredential.getString("userId");
    });
    Future.delayed(Duration(seconds: 3), () {
      if(userId !=null){
        Navigator.pushReplacementNamed(context, 'home_screen');
      }else{
        Navigator.pushReplacementNamed(context, 'login_screen');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Gemini Comp"),
      ),
    );
  }
}
