import 'dart:convert';
import 'package:book_store_app/consts/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final profileFormKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    userController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
  }

  void getUserRequst() async {
    var https = http.Client();
    final url = Uri.parse('$apiBaseURL/registration');
    Map<String, String> headers = {"Content-type": "application/json"};    
    // make Get request
    var response = await https.get(url, headers: headers);
    int statusCode = response.statusCode;
    print(json);
    // this API passes back the id of the new item added to the body
    String body = response.body;
    // success or error msg
    if (statusCode == 200) {
      String message = jsonDecode(body)['message'];
      Get.snackbar('success msg', message);
      // todo: navigate somewhere
    } else {
      Get.snackbar('error', 'Something gone wrong');
    }
  }
}
