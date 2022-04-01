import 'package:book_store_app/models/User.dart';
import 'package:book_store_app/services/user_provider.dart';
import 'package:book_store_app/views/pages/Registration/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with StateMixin<List<User>> {
  final RegistrationController _regC = Get.find();
  final usernameController = TextEditingController();
  final addressController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();

  void onInit() async {
    super.onInit();
    try {
      change(null, status: RxStatus.loading());
      final _user = await UserProvider().getUser();
      if (_user == []) {
        change([], status: RxStatus.empty());
      } else {
        usernameController.text = _user[0].userName;
        addressController.text = _user[0].address;
        phoneNumberController.text = _user[0].phoneNo;
        _regC.selectedCity.value = _user[0].city;
        zipCodeController.text = _user[0].zipCode;
        change(_user, status: RxStatus.success());
      }
    } catch (err) {
      change(null, status: RxStatus.error('$err'));
    }
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
