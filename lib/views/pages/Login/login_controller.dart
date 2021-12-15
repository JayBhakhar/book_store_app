import 'dart:convert';
import 'package:book_store_app/consts/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final box = GetStorage();

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
    String body = response.body;
    if (statusCode == 200) {
      String token = jsonDecode(body)['token'];
      box.write('token', token);
      print(token);
      // get value
      // box.read('token')
      Get.toNamed('/');
    } else if (statusCode == 401) {
      String message = jsonDecode(body)['message'];
      Get.snackbar('login fail', message);
    } else {
      Get.snackbar('error', 'Something gone wrong');
    }
  }
}
