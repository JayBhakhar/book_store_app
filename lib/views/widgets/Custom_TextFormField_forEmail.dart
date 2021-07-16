import 'package:flutter/material.dart';

class CustomTextFormFieldForEmail extends StatelessWidget {
  final TextEditingController controller;
  CustomTextFormFieldForEmail({this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
      child: TextFormField(
        controller: controller,
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
            return 'Please a Enter Email';
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return 'Please a valid Email';
          }
          return null;
        },
      ),
    );
  }
}
