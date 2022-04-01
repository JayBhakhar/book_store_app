import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/views/pages/Choose_Supplier/choose_supplier_controller.dart';
import 'package:book_store_app/views/widgets/choose_supplier_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseSupplierView extends GetView<ChooseSupplierController> {
  @override
  Widget build(BuildContext context) {
    var arg = Get.arguments;
    final List<Book> _book = arg['book'];
    return Scaffold(
      appBar: AppBar(),
      body: controller.obx(
        (state) => GridView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400.0,
            mainAxisExtent: 130,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
          ),
          itemBuilder: (BuildContext context, index) {
            return chooseSupplierCard(state, _book, index);
          },
        ),
      ),
    );
  }
}
