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
            : SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.builder(
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
                    TextButton(
                      onPressed: () {
                        Get.defaultDialog(
                            title: "Are you sure ?",
                            backgroundColor: Colors.blueAccent,
                            titleStyle: TextStyle(color: Colors.white),
                            middleTextStyle: TextStyle(color: Colors.white),
                            textConfirm: "Remove",
                            textCancel: "Cancel",
                            cancelTextColor: Colors.black,
                            confirmTextColor: Colors.black,
                            buttonColor: Colors.white,
                            barrierDismissible: true,
                            content: Text('To remove all books from cart'),
                            onConfirm: () {
                              var data = box.read('addCardList');
                              data.clear();
                              controller.addCartList.clear();
                              box.write('addCardList', data);
                              Get.back();
                              Get.snackbar('success', 'all books removed to cart',
                                  snackPosition: SnackPosition.BOTTOM);
                            });
                      },
                      child: Text('Remove all books'),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
