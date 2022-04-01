import 'package:book_store_app/services/user_provider.dart';
import 'package:book_store_app/views/pages/Registration/registration_controller.dart';
import 'package:book_store_app/views/widgets/city_dropdownbutton.dart';
import 'package:book_store_app/views/widgets/custom_textFormField_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationView extends GetView<RegistrationController> {
  final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: registrationFormKey,
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
                cityDropdownButton(),
                customTextFormFieldForStr(
                  controller: controller.addressController,
                  labelText: 'Address',
                ),
                customTextFormFieldForInt(
                  controller: controller.zipCodeController,
                  labelText: 'Zip Code',
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      bool _isValid =
                          registrationFormKey.currentState.validate();
                      if (_isValid) {
                        String body =
                            '{"email":"${controller.emailController.text}",'
                            '"user_name":"${controller.userController.text}",'
                            '"password":"${controller.passwordController.text}",'
                            '"address":"${controller.addressController.text}",'
                            '"city":"${controller.selectedCity}",'
                            '"zip_code":"${controller.zipCodeController.text}",'
                            '"phone_number":"${controller.phoneNumberController.text}",}';
                        UserProvider().createUser(body);
                      }
                    },
                    child: Text("Registration"),
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
