import 'package:book_store_app/models/User.dart';
import 'package:book_store_app/services/user_provider.dart';
import 'dart:convert';
import 'package:book_store_app/consts/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with StateMixin<List<User>> {
  final profileFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();

  void onInit() {
    super.onInit();
    UserProvider().getUser().then((resp) {
      change(
        resp,
        status: RxStatus.success(),
      );
      List<User> user = resp;
      usernameController.text = user[0].userName;
      addressController.text = user[0].address;
      phoneNumberController.text = user[0].phoneNo;
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(
          err.toString(),
        ),
      );
    });
  }

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
  }

  void userPutRequst() async {
    final box = GetStorage();
    final token = box.read('token');
    var https = http.Client();
    final url = Uri.parse('$apiBaseURL/registration');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Authorization': 'Bearer $token'
    };
    String json = '{"user_name":"${usernameController.text}",'
        '"address":"${addressController.text}",'
        '"phone_number":"${phoneNumberController.text}"}';
    // make Put request
    var response = await https.put(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    print(json);
    // this API passes back the id of the new item added to the body
    String body = response.body;
    // success or error msg
    if (statusCode == 200) {
      String message = jsonDecode(body)['message'];
      Get.snackbar('success msg', message);
      Get.back();
    } else {
      Get.snackbar('error', 'Something gone wrong');
    }
  }
}
