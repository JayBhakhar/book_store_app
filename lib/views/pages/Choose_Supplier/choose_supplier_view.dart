import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/views/pages/Choose_Supplier/choose_supplier_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseSupplierView extends GetView<ChooseSupplierController> {
  @override
  Widget build(BuildContext context) {
    var arg = Get.arguments;
    final List<Book> _book = arg['book'];
    return Container();
  }
}
