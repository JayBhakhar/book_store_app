import 'dart:convert';
import 'package:book_store_app/views/pages/Forget_Password/forget_password.dart';
import 'package:book_store_app/views/pages/Home_Screen/home.dart';
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
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
              child: TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  labelText: 'Email',
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please a Enter';
                  }
                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return 'Please a valid Email';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
              child: TextFormField(
                controller: password,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.blue, width: 1.5),
                  ),
                  labelText: 'Password',
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please a Enter Password';
                  }
                  return null;
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ForgetPassword(),
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
                onPressed: () async {
                  final url = Uri.parse('http://192.168.137.1:5000/login');
                  Map<String, String> headers = {
                    "Content-type": "application/json"
                  };
                  String json = '{"email":"${email.text}",'
                      '"password":"${password.text}"}';

                  // make POST request
                  Response response =
                  await post(url, headers: headers, body: json);
                  // check the status code for the result
                  int statusCode = response.statusCode;
                  // this API passes back the id of the new item added to the body
                  String body = response.body;
                  // IF LOGIN OR PASSWORD NOT MATCH SEND RESPONSE MESSAGE
                  if (statusCode==200) {
                    Map<String, dynamic> userToken = jsonDecode(body);
                    token = userToken['token'];
                    saveToken();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  }
                },
              ),
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
