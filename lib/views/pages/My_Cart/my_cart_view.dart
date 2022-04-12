import 'package:book_store_app/models/Cart.dart';
import 'package:book_store_app/views/pages/My_Cart/my_cart_controller.dart';
import 'package:book_store_app/views/widgets/add_cart_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyCartView extends GetView<MyCartController> {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    var data = box.read('addCardList');
    // List<Cart> _addCardList = Cart.listFromJson(data);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: data.isEmpty
          ? Center(
              child: Text('Your Cart Empty'),
            )
          : GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400.0,
                mainAxisExtent: 210,
                crossAxisSpacing: 0.5,
                mainAxisSpacing: 0.5,
              ),
              itemBuilder: (BuildContext context, index) {
                List<Cart> _addCartList = Cart.listFromJson(data);
                return addCartCard(_addCartList, index);
              },
            ),
    );
  }
}
