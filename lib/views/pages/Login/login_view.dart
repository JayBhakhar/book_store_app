import 'package:book_store_app/views/pages/Login/login_controller.dart';
import 'package:book_store_app/views/widgets/Custom_TextFormField_forEmail.dart';
import 'package:book_store_app/views/widgets/Custom_TextFormField_forStr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 1, left: 1, right: 1),
        child: Form(
          key: controller.loginFormKey,
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
              CustomTextFormFieldForStr(
                controller: controller.passwordController,
                labelText: 'Password',
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed('/forgetPassword');
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ForgetPassword(),
                  //   ),
                  // );
                },
                child: Text('Forgot Password'),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    child: Text('Login'),
                    onPressed: () {
                      controller.loginRequest();
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
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         Registration(), //Registration screen
                        //   ),
                        // );
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
