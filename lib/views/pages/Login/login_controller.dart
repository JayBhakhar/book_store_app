import 'dart:convert';

import 'package:book_store_app/consts/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginRequest() async {
    var https = http.Client();
    final url = Uri.parse('$apiBaseURL/login');
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"email":"${emailController.text}",'
        '"password":"${passwordController.text}"}';
    // make POST request
    var response = await https.post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;
    // IF LOGIN OR PASSWORD NOT MATCH SEND RESPONSE MESSAGE
    if (statusCode == 200) {
      Map<String, dynamic> userToken = jsonDecode(body);
      // token = userToken['token'];
      // saveToken(); // need to write
      // Get.to()

      
    } else if (statusCode == 401) {
      
    }
  }
}
