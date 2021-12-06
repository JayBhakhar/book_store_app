import 'package:book_store_app/models/User.dart';
import 'package:book_store_app/services/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final profileFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();  

  void onInit() {
    super.onInit();
    UserProvider().getUser().then((resp) {
      List<User> user = resp;
      nameController.text = user[0].name;
      addressController.text = user[0].address;
      phoneNumberController.text = user[0].phoneNo;
    });
  }

   @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
  }
}
