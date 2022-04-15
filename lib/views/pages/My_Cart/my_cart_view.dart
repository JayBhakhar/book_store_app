import 'package:book_store_app/views/pages/My_Cart/my_cart_controller.dart';
import 'package:book_store_app/views/widgets/add_cart_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCartView extends GetView<MyCartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Cart'),
        ),
        body: Obx(
          () => controller.addCartList.isEmpty
              ? Center(
                  child: Text('Your Cart Empty'),
                )
              : GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.addCartList.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400.0,
                    mainAxisExtent: 130,
                    crossAxisSpacing: 0.5,
                    mainAxisSpacing: 0.5,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return addCartCard(controller.addCartList, index);
                  },
                ),
        ));
  }
}
