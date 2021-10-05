import 'package:book_store_app/Unit_Test/test_controller.dart';
import 'package:book_store_app/views/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends GetView<TestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (_book) => ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _book.length,
          // itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return bookCard(_book, index);
          },
        ),
      ),
    );
  }
}
