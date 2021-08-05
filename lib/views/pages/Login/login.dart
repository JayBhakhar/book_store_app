import 'dart:convert';
import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/views/pages/Forget_Password/forget_password.dart';
import 'package:book_store_app/views/pages/Home_Screen/home.dart';
import 'package:book_store_app/views/pages/Splash_Screen/splash_screen.dart';
import 'package:book_store_app/views/widgets/Custom_TextFormField_forEmail.dart';
import 'package:book_store_app/views/widgets/Custom_TextFormField_forStr.dart';
import 'package:http/http.dart';
import 'package:book_store_app/views/pages/Registration/registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String token;

  Future<void> saveToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  _loginRequest() async {
    final url = Uri.parse('$apiBaseURL/login');
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"email":"${email.text}",'
        '"password":"${password.text}"}';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;
    // IF LOGIN OR PASSWORD NOT MATCH SEND RESPONSE MESSAGE
    if (statusCode == 200) {
      Map<String, dynamic> userToken = jsonDecode(body);
      token = userToken['token'];
      saveToken();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SplashScreen(),
        ),
      );
    } else if (statusCode == 401) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(body),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 1, left: 1, right: 1),
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
            CustomTextFormFieldForEmail(
              controller: email,
            ),
            CustomTextFormFieldForStr(
              controller: password,
              labelText: 'Password',
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgetPassword(),
                  ),
                );
              },
              child: Text('Forgot Password'),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                  child: Text('Login'),
                  onPressed: () {
                    _loginRequest();
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Registration(), //Registration screen
                        ),
                      );
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
