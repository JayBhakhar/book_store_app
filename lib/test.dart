import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}


class _TestState extends State<Test> {

  SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                onPressed: (){},
                child: Text('Unit Test'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
