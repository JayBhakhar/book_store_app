import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

_makepost() async{
  final url = Uri.parse('http://192.168.0.112:5000/users');
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '';
  // make POST request
  Response response = await get(url, headers: headers);
  // check the status code for the result
  int statusCode = response.statusCode;
  // this API passes back the id of the new item added to the body
  String body = response.body;
  if(statusCode==200) {
    Map<String, dynamic> responseMessage = jsonDecode(body);
    var user = responseMessage['users'];
    print(user);
    var email = user[1]['email'];
    print(email);
  }
}


class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                onPressed: _makepost,
                child: Text('Unit Test'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
