import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/screen/authentication/create_account_screen.dart';
import 'package:gemini_comp_ai/screen/authentication/login_account_screen.dart';
import 'package:gemini_comp_ai/screen/home_screen/home_screen.dart';
import 'package:gemini_comp_ai/screen/splash_screen/splash_screen.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

void main() async {
  const keyApplicationId = 'x9lflGkpyK2i9jWoHxU4VWQhCKYYlpTvZoNbiPo7';
  const keyClientKey = 'WUuCLxOZsylk5VbI2Ky6t5wSpPny6MHHWzhLJpOy';
  const keyParseServerUrl = 'https://parseapi.back4app.com';
  await Parse().initialize(keyApplicationId, keyParseServerUrl, clientKey: keyClientKey, debug: true);
  const String apiKey = 'AIzaSyANH2im6noAKtHhHRsPZmQdKrHzICkOtAI';
  if (apiKey.isEmpty) {
    throw Exception('API key is not set. Please obtain one from Google AI Studio.');
  }

  final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);

  runApp(MyApp(model: model));
}

class MyApp extends StatelessWidget {
  final GenerativeModel model;

  const MyApp({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.white,
        // textTheme: TextTheme(
        //   bodyText1: TextStyle(color: Colors.white),
        //   bodyText2: TextStyle(color: Colors.white),
        // ),
      ),
      initialRoute: 'splash_screen',
      routes: {
        'splash_screen': (context) => SplashScreen(),
        'home_screen': (context) => HomeScreen(model: model),
        'login_screen': (context) => LoginAccountScreen(),
        'create_account_screen': (context) => CreateAccountScreen(),
      },
      // home: HomeScreen(model: model),
    );
  }
}
