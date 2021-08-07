import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget CustomTextFormFieldForIntWithlen({
  final TextEditingController controller,
  final String labelText,
  final int length,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
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
        } else if (value.length != length) {
          return 'Please enter $length digits';
        }
        return null;
      },
    ),
  );
}
