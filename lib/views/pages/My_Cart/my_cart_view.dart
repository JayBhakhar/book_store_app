import 'package:book_store_app/views/pages/My_Cart/my_cart_controller.dart';
import 'package:book_store_app/views/widgets/add_cart_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
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
                                  Get.snackbar(
                                      'success', 'all books removed to cart',
                                      snackPosition: SnackPosition.BOTTOM);
                                });
                          },
                          child: Text('Remove all books'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final total = [];
                            for (var i = 0;
                                i < controller.addCartList.length;
                                i++) {
                              total.add(controller.addCartList[i].total);
                            }
                            num sum = 0;
                            total.forEach((e) {
                              sum += e;
                            });
                            GetStorage box = GetStorage();
                            Get.toNamed('/payment', arguments: sum);
                          },
                          child: const Text('Order Now'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
