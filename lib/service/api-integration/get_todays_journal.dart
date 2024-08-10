import 'dart:convert';
import 'dart:io';
import 'package:gemini_comp_ai/service/network_response/network_response.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<NetworkResponse<List<dynamic>>> getTodayJournalList({
  required String userId,
}) async {
  try {
    QueryBuilder<ParseObject> queryPublisher = QueryBuilder<ParseObject>(
      ParseObject('TodaysJournalTable'),
    );
    queryPublisher.orderByDescending('createdAt');
    queryPublisher.whereEqualTo("userId", userId);
    final ParseResponse queryResponse = await queryPublisher.query();

    if (queryResponse.statusCode == 200) {
      dynamic jsonResponse = await jsonDecode(queryResponse.results.toString());
      List<dynamic> dataList = [];
      jsonResponse.forEach((e) {
        // CategoryJsonModel responseData = CategoryJsonModel.fromJson(e);
        dataList.add(e);
      });
      return NetworkResponse(true, dataList);
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
