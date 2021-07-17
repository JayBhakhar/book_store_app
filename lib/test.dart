import 'package:book_store_app/views/widgets/Custom_TextFormField_Forcountry.dart';
import 'package:flutter/material.dart';
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
              ),
              CustomTextFormFieldForCountry(),
            ],
          ),
        ),
      ),
    );
  }
}
