import 'dart:convert';
import 'dart:io';
import 'package:gemini_comp_ai/service/network_response/network_response.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<NetworkResponse<dynamic>> createTodayJournal({
  required String userId,
  required String contextThred,
  required String journal,
}) async {
  try {
    ParseObject createAccountDetails = ParseObject('TodaysJournalTable')
      ..set('userId', userId)
      ..set('contextThred', contextThred)
      ..set('journal', journal);

    final response = await createAccountDetails.save();

    if (response.success) {
      dynamic jsonResponse = json.decode(response.result.toString());
      // UserAccountJsonModel responseData = UserAccountJsonModel.fromJson(jsonResponse);
      return NetworkResponse(true, jsonResponse, message: 'Successfully created todays journal');
    } else {
      return NetworkResponse(false, null, message: 'Invalid response received from server!');
    }
  } on SocketException {
    return NetworkResponse(false, null, message: "Unable to reach the internet! Please try again in a minutes or two");
  } on FormatException {
    return NetworkResponse(false, null, message: "Invalid response received form the server!");
  } catch (e) {
    return NetworkResponse(false, null, message: "something went wrong! Please try again in a minutes or two");
  }
}
