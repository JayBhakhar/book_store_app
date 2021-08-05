import 'dart:convert';
import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/views/pages/Login/login.dart';
import 'package:book_store_app/views/widgets/Custom_TextFormField_Forcountry.dart';
import 'package:book_store_app/views/widgets/Custom_TextFormField_forEmail.dart';
import 'package:book_store_app/views/widgets/Custom_TextFormField_forInt_Withlen.dart';
import 'package:book_store_app/views/widgets/Custom_TextFormField_forStr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();

  static _RegistrationState of(BuildContext context) =>
      context.findAncestorStateOfType<_RegistrationState>();
}

class _RegistrationState extends State<Registration> {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  int countryCode;
  bool isSeller = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _makePostRequest() async {
    // set up POST request arguments
    final url = Uri.parse('$apiBaseURL/registration');
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{'
        '"userName": "${userName.text}",'
        '"email": "${email.text}",'
        '"password": "${password.text}",'
        '"phoneNumber": "${phoneNumber.text}",'
        '"address": "${address.text}",'
        '"country": $countryCode'
        '"seller": "$isSeller",'
        '}';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;
    if (statusCode == 200) {
      Map<String, dynamic> responseMessage = jsonDecode(body);
      var message = responseMessage['message'];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      // backend message needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                CustomTextFormFieldForStr(
                  controller: userName,
                  labelText: 'Name',
                ),
                CustomTextFormFieldForEmail(
                  controller: email,
                ),
                CustomTextFormFieldForStr(
                  controller: password,
                  labelText: 'Password',
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: confirmpassword,
                    obscureText: true,
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
                      if (password.text != confirmpassword.text) {
                        return "Password does not match";
                      }
                      return null;
                    },
                  ),
                ),
                CustomTextFormFieldForIntWithlen(
                  controller: phoneNumber,
                  labelText: 'Phone No',
                  length: 10,
                ),
                CustomTextFormFieldForStr(
                  controller: address,
                  labelText: 'Address',
                ),
                CustomTextFormFieldForCountry(),
                CheckboxListTile(
                  title: Text("I want to be a Seller"),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: isSeller,
                  onChanged: (bool value) {
                    setState(() {
                      isSeller = value;
                    });
                  },
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      bool _isValid = _formKey.currentState.validate();
                      // if (faculty == null) {
                      //   setState(() => _dropdownErrorFaculty =
                      //   "Please select Faculty");
                      //   _isValid = false;
                      // }
                      if (_isValid) {
                        _makePostRequest();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(), // login screen
                          ),
                        );
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
