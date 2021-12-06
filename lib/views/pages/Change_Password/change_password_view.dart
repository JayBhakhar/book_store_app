import 'package:book_store_app/views/pages/Change_Password/change_password_controller.dart';
import 'package:book_store_app/views/widgets/custom_textFormField_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.changepasswordFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                customTextFormFieldForStrWithValidator(
                  controller: controller.currentpasswordController,
                  labelText: 'current password',
                ),
                customTextFormFieldForPassword(
                  controller: controller.newpasswordController,
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
                      labelText: 'Re-enter New Password',
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please re-enter password';
                      }
                      if (controller.newpasswordController.text !=
                          controller.confirmpasswordController.text) {
                        return "Password does not match";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      bool _isValid = controller
                          .changepasswordFormKey.currentState
                          .validate();
                      if (_isValid) {
                        // controller.changepasswordRequst();
                      }
                    },
                    child: Text("Change Password"),
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
