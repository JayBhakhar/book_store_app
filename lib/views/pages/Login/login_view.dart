import 'package:book_store_app/views/pages/Login/login_controller.dart';
import 'package:book_store_app/views/widgets/custom_textFormField_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 1, left: 1, right: 1),
        child: Form(
          key: loginFormKey,
          child: ListView(
            children: [
              SizedBox(
                height: 150,
              ),
              CircleAvatar(
                radius: 60,
                child: Icon(
                  Icons.account_circle_sharp,
                  size: 120,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              customTextFormFieldForEmail(
                controller: controller.emailController,
              ),
              customTextFormFieldForPassword(
                controller: controller.passwordController,
                labelText: 'Password',
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed('/forgetPassword');
                },
                child: Text('Forgot Password'),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    child: Text('Login'),
                    onPressed: () {
                      bool _isValid = loginFormKey.currentState.validate();
                      if (_isValid) {
                        controller.loginRequest();
                      }
                      // login function
                    }),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text('Does not have account?'),
                    TextButton(
                      child: Text(
                        'Registration',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueAccent,
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed('/registration');
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
