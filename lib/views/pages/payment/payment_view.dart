import 'package:book_store_app/services/api_services.dart';
import 'package:book_store_app/views/pages/My_Cart/my_cart_controller.dart';
import 'package:book_store_app/views/pages/payment/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentView extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Pay :- ${controller.total.toString()} RUB'),
          onPressed: () {
            MyCartController _myCC = Get.find();
            final order = [];
            for (var i = 0; i < _myCC.addCartList.length; i++) {
              order.add(
                {
                  '"book_id"': '"${_myCC.addCartList[i].book.bookID}"',
                  '"supplier_name"': '"${_myCC.addCartList[i].supplierName}"',
                  '"supplier_book_id"':
                      "${_myCC.addCartList[i].supplierBookId}",
                  '"total"': "${_myCC.addCartList[i].total.toString()}",
                  '"post"': '"${_myCC.addCartList[i].post}"'
                },
              );
            }
            String jsonBody = '{"order": $order}';
            ApiServices().postOrderRequst(jsonBody);
          },
        ),
      ),
    );
  }
}
