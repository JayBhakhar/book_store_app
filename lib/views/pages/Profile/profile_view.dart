import 'package:book_store_app/views/pages/Profile/profile_controller.dart';
import 'package:book_store_app/views/widgets/custom_textFormField_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.profileFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.account_circle_sharp,
                    size: 120,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                customTextFormFieldForStrWithValidator(
                  controller: controller.nameController,
                  labelText: 'Name',
                ),
                customTextFormFieldForIntWithlen(
                  controller: controller.phoneNumberController,
                  labelText: 'Phone No',
                  length: 10,
                ),
                customTextFormFieldForStrWithValidator(
                  controller: controller.addressController,
                  labelText: 'Address',
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/changepassword');
                  },
                  child: Text('change password'),
                ),
                TextButton(
                  onPressed: () {
                    bool _isValid =
                        controller.profileFormKey.currentState.validate();
                    if (_isValid) {
                      // controller.userPutRequst();                      
                    }
                  },
                  child: Text("Save My Profile Details"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
