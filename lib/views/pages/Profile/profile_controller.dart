import 'package:book_store_app/models/User.dart';
import 'package:book_store_app/services/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with StateMixin<List<User>> {
  final usernameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
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
        cityController.text = _user[0].city;
        zipCodeController.text = _user[0].zipCode;
        change(_user, status: RxStatus.success());
      }
    } catch (err) {
      change(null, status: RxStatus.error('$err'));
    }
    // UserProvider().getUser().then((resp) {
    //   change(
    //     resp,
    //     status: RxStatus.success(),
    //   );
    //   List<User> user = resp;
    //   usernameController.text = user[0].userName;
    //   addressController.text = user[0].address;
    //   phoneNumberController.text = user[0].phoneNo;
    //   cityController.text = user[0].city;
    //   zipCodeController.text = user[0].zipCode;
    // }, onError: (err) {
    //   change(
    //     null,
    //     status: RxStatus.error(
    //       err.toString(),
    //     ),
    //   );
    // });
  }

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
    cityController.dispose();
    zipCodeController.dispose();
  }
}
