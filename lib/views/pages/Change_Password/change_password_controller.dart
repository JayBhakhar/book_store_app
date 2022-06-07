import 'dart:convert';
import 'package:book_store_app/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ChangePasswordController extends GetxController {
  GlobalKey<FormState> changepasswordFormKey = GlobalKey<FormState>();
  final currentpasswordController = TextEditingController();
  final newpasswordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    currentpasswordController.dispose();
    newpasswordController.dispose();
    confirmpasswordController.dispose();
  }

  void changepasswordRequst() async {
    final box = GetStorage();
    final token = box.read('token');
    var https = http.Client();
    final url = Uri.parse('$apiBaseURL/change_password');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Authorization': 'Bearer $token'
    };
    String json = '{'
        '"current_password":"${currentpasswordController.text}",'
        '"new_password":"${newpasswordController.text}"'
        '}';
    // make Put request
    var response = await https.put(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    String body = response.body;
    // success or error msg
    if (statusCode == 200) {
      String message = jsonDecode(body)['message'];
      Get.snackbar('success msg', message);
      Get.toNamed('/home');
    } else if (statusCode == 401) {
      String message = jsonDecode(body)['message'];
      Get.defaultDialog(
        title: "Password",
        middleText: message,
        textConfirm: "Forget Password",
        textCancel: "Try Again",
        buttonColor: Colors.blue,
        radius: 5,
        confirmTextColor: Colors.white,
        onConfirm: () => Get.toNamed('/forgetpassword'),
      );
    } else {
      Get.snackbar('error', 'Something gone wrong');
    }
  }
}
