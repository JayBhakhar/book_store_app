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
                customTextFormFieldForStr(
                  controller: controller.userController,
                  labelText: 'Name',
                ),
                customTextFormFieldForEmail(
                  controller: controller.emailController,
                ),
                customTextFormFieldForPassword(
                  controller: controller.passwordController,
                  labelText: 'Password',
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: controller.confirmpasswordController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.blue, width: 1.5),
                      ),
                      labelText: 'Confirm Password',
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please re-enter password';
                      }
                      if (controller.passwordController.text !=
                          controller.confirmpasswordController.text) {
                        return "Password does not match";
                      }
                      return null;
                    },
                  ),
                ),
                customTextFormFieldForInt(
                  controller: controller.phoneNumberController,
                  labelText: 'Phone No',
                ),
                customTextFormFieldForStr(
                  controller: controller.addressController,
                  labelText: 'Address',
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      bool _isValid =
                          controller.profileFormKey.currentState.validate();
                      if (_isValid) {
                        controller.editprofileRequest();
                      }
                    },
                    child: Text("Save"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
