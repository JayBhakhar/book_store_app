import 'package:flutter/material.dart';

class CustomTextFormFieldForStr extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  CustomTextFormFieldForStr({this.controller, this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.blue, width: 1.5),
            ),
            labelText: labelText,
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Please Enter $labelText';
            }
            return null;
          },
        ),
      );
  }
}
