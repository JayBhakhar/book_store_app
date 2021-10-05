import 'dart:convert';
import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/User.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;

class UserAPI {
  Future<List<User>> getCurrentUser() async {
    prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('$apiBaseURL/user');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'x-access-token': '${prefs.getString('token')}'
    };
// make Post request
    Response response = await get(url, headers: headers);
// check the status code for the result
    int statusCode = response.statusCode;
// this API passes back the id of the new item added to the body
    String body = response.body;
    if (statusCode == 200) {
      var userObjs = jsonDecode(body)['user'] as List;
      return userObjs.map((bookJson) => User.fromJson(bookJson)).toList();
    }
  }

  Future<List<User>> get_confirm_sellers_list() async {
     prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('$apiBaseURL/confirm_sellers');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'x-access-token': '${prefs.getString('token')}'
    };
    // make Post request
    Response response = await get(url, headers: headers);
    // check the status code for the result
    int statusCode = response.statusCode;
    print(statusCode);
    // this API passes back the id of the new item added to the body
    String body = response.body;
    if (statusCode == 200) {
      var userObjs = jsonDecode(body)['sellers'] as List;
      return userObjs.map((bookJson) => User.fromJson(bookJson)).toList();
    }
  }

  Future<List<User>> get_sellers_requests() async {
    prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('$apiBaseURL/newSellers');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'x-access-token': '${prefs.getString('token')}'
    };
    // make Post request
    Response response = await get(url, headers: headers);
    // check the status code for the result
    int statusCode = response.statusCode;
    String body = response.body;
    if (statusCode == 200) {
      var userObjs = jsonDecode(body)['newSellers'] as List;
      return userObjs.map((bookJson) => User.fromJson(bookJson)).toList();
    }
  }
}
