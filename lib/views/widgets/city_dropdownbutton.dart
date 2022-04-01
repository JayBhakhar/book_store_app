import 'package:book_store_app/views/pages/Registration/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget cityDropdownButton() {
  final RegistrationController controller = Get.find();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Text('Select city :'),
      ),
      Obx(
        () => Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
          child: DropdownButton(
              iconSize: 35.0,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
              ),
              underline: Container(),
              isExpanded: true,
              onChanged: (newValue) {
                controller.selectedCity.value = newValue;
              },
              value: controller.selectedCity.value,
              items: [
                for (var data in controller.cityList)
                  DropdownMenuItem(
                    child: new Text(
                      data,
                    ),
                    value: data,
                  )
              ]),
        ),
      ),
    ],
  );
}
