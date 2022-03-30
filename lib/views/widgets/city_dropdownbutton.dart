import 'package:book_store_app/views/pages/Registration/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget cityDropdownButton() {
  final RegistrationController controller = Get.find();
  return DropdownButton(
      hint: Text('select city'),
      onChanged: (newValue) {
        controller.selectedCity = newValue;
        controller.update();
      },
      value: controller.selectedCity,
      items: [
        for (var data in controller.cityList)
          DropdownMenuItem(
            child: new Text(
              data,
            ),
            value: data,
          )
      ]);
}
