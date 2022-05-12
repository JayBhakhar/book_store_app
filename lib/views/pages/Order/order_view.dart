import 'package:book_store_app/views/pages/Order/order_controller.dart';
import 'package:book_store_app/views/pages/Splash_Screen/splash_controller.dart';
import 'package:book_store_app/views/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderView extends GetView<OrderController> {
  final SplashController _splC = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _splC.user[0].isSeller ?Text("My Client's Order"): Text('My Order'),
      ),
      body: controller.obx(
        (state) => state.isEmpty
            ? Center(
                child: Text('You do not have order yet'),
              )
            : SingleChildScrollView(
                child: Column(children: [
                  GridView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400.0,
                      mainAxisExtent: 130,
                      crossAxisSpacing: 0.5,
                      mainAxisSpacing: 0.5,
                    ),
                    itemBuilder: (BuildContext context, index) {
                      return orderCard(state, index);
                    },
                  ),
                ]),
              ),
      ),
    );
  }
}
