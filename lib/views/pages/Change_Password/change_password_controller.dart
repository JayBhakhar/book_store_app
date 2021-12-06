import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final changepasswordFormKey = GlobalKey<FormState>();
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
}
