import 'package:flutter/material.dart';
import 'package:gemini_comp_ai/screen/authentication/login_account_screen.dart';
import 'package:gemini_comp_ai/service/shared_preference/shared_prference.dart';

class HomeScreenModel with ChangeNotifier {
  late BuildContext _context;
  HomeScreenModel(this._context) {}
  logout() {
    clearUserLoginCredential();
    Navigator.pushReplacement(
      _context,
      MaterialPageRoute(
        builder: (context) => LoginAccountScreen(),
      ),
    );
  }
}
