import 'package:shared_preferences/shared_preferences.dart';

Future<void> userLoginCredential({
  required String userId,
}) async {
  SharedPreferences userLoginCredential = await SharedPreferences.getInstance();
  userLoginCredential.setString('userId', userId);
}