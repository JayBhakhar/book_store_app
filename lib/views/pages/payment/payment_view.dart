import 'package:book_store_app/views/pages/payment/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentView extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(controller.total[1].toString()),
      ),
    );
  }
}
