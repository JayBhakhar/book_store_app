import 'package:book_store_app/models/User.dart';
import 'package:book_store_app/views/pages/Registration/registration_controller.dart';
import 'package:book_store_app/views/pages/Splash_Screen/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  final RegistrationController _regC = Get.find();
  final SplashController _splC = Get.find();
  final usernameController = TextEditingController();
  final addressController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();

  void onInit() async {
    super.onInit();
    List<User> _user = _splC.user;
    usernameController.text = _user[0].userName;
    addressController.text = _user[0].address;
    phoneNumberController.text = _user[0].phoneNo;
    _regC.selectedCity.value = _user[0].city;
    zipCodeController.text = _user[0].zipCode;    
  }

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
    zipCodeController.dispose();
  }
}
