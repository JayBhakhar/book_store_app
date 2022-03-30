import 'package:book_store_app/services/user_provider.dart';
import 'package:book_store_app/views/pages/Profile/profile_controller.dart';
import 'package:book_store_app/views/widgets/city_dropdownbutton.dart';
import 'package:book_store_app/views/widgets/custom_textFormField_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileView extends GetView<ProfileController> {
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: profileFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                controller.obx((user) {
                  return Text(
                    "Your email : ${user[0].email}",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
                SizedBox(
                  height: 15,
                ),
                customTextFormFieldForStrWithValidator(
                  controller: controller.usernameController,
                  labelText: 'Name',
                ),
                customTextFormFieldForIntWithlen(
                  controller: controller.phoneNumberController,
                  labelText: 'Phone No',
                  length: 10,
                ),
                customTextFormFieldForStrWithValidator(
                  controller: controller.cityController,
                  labelText: 'City',
                ),
                cityDropdownButton(),
                customTextFormFieldForStrWithValidator(
                  controller: controller.addressController,
                  labelText: 'Address',
                ),
                customTextFormFieldForStrWithValidator(
                  controller: controller.zipCodeController,
                  labelText: 'Zip Code',
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/changepassword');
                  },
                  child: Text('change password'),
                ),
                TextButton(
                  onPressed: () {
                    bool _isValid = profileFormKey.currentState.validate();
                    if (_isValid) {
                      String body =
                          '{"user_name":"${controller.usernameController.text}",'
                          '"address":"${controller.addressController.text}",'
                          '"zip_code":"${controller.zipCodeController.text}",'
                          '"city":"${controller.cityController.text}",'
                          '"phone_number":"${controller.phoneNumberController.text}"}';
                      UserProvider().updateUser(body);
                    }
                  },
                  child: Text("Save My Profile Details"),
                ),
                TextButton(
                  child: Text('Log out'),
                  onPressed: () {
                    box.remove('token');
                    Get.toNamed('/');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
