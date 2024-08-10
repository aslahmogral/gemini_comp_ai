import 'package:shared_preferences/shared_preferences.dart';

Future<void> userLoginCredential({
  required String userId,
  required String email,
  required String userName,
  required String reminderDateTime,
  required String reminderTime,
}) async {
  SharedPreferences userLoginCredential = await SharedPreferences.getInstance();
  userLoginCredential.setString('userId', userId);
  userLoginCredential.setString('email', email);
  userLoginCredential.setString('userName', userName);
  userLoginCredential.setString('reminderDateTime', reminderDateTime);
  userLoginCredential.setString('reminderTime', reminderTime);
}

Future<void> clearUserLoginCredential() async {
  SharedPreferences userLoginCredential = await SharedPreferences.getInstance();
  userLoginCredential.remove('userId');
  userLoginCredential.remove('password');
  userLoginCredential.remove('email');
  userLoginCredential.remove('userName');
  userLoginCredential.remove('reminderDateTime');
  userLoginCredential.remove('reminderTime');
}
