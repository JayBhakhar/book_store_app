import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget customTextFormFieldForEmail({final TextEditingController controller}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
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
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return 'Please a valid Email';
        }
        return null;
      },
    ),
  );
}

Widget customTextFormFieldForInt({
  final TextEditingController controller,
  final String labelText,
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
    ),
  );
}

Widget customTextFormFieldForStr({
  final TextEditingController controller,
  final String labelText,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
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
    ),
  );
}

Widget customTextFormFieldForStrWithValidator({
  final TextEditingController controller,
  final String labelText,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
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


Widget customTextFormFieldForPassword({
  final TextEditingController controller,
  final String labelText,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
    child: TextFormField(
      obscureText: true,
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