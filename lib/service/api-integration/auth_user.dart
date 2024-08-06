import 'dart:convert';
import 'dart:io';
import 'package:gemini_comp_ai/json_model/user_account_jsonmodel.dart';
import 'package:gemini_comp_ai/service/network_response/network_response.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<NetworkResponse<UserAccountJsonModel>> userLogin({
  required String password,
  required String email,
}) async {
  try {
    QueryBuilder<ParseObject> queryPublisher = QueryBuilder<ParseObject>(
      ParseObject('UserAccountTable'),
    );
    queryPublisher.whereEqualTo('email', email);
    queryPublisher.whereEqualTo('password', password);
    final ParseResponse queryResponse = await queryPublisher.query();

    // ParseUser user = ParseUser(username, password, null);
    // response = await user.login();
    if (queryResponse.statusCode == 200 && queryResponse.results!.isNotEmpty) {
      dynamic jsonResponse = await jsonDecode(queryResponse.results!.first.toString());
      UserAccountJsonModel responseData = UserAccountJsonModel.fromJson(jsonResponse);
      return NetworkResponse(true, responseData, message: "User Logged in: ${queryResponse.result}");
    } else {
      return NetworkResponse(false, null, message: "Error: ${queryResponse.result}");
    }
  } on SocketException {
    return NetworkResponse(false, null, message: "Unable to reach the internet! Please try again in a minutes or two");
  } on FormatException {
    return NetworkResponse(false, null, message: "Invalid response received form the server!");
  } catch (e) {
    return NetworkResponse(false, null, message: "something went wrong! Please try again in a minutes or two");
  }
}
