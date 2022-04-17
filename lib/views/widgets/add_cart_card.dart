import 'package:book_store_app/models/Cart.dart';
import 'package:book_store_app/views/pages/My_Cart/my_cart_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget addCartCard(List<Cart> _cart, int index) {
  MyCartController _myCC = Get.find();
  return Card(
    child: Row(
      children: [
        Container(
            width: 100,
            child: Image.network('https://${_cart[index].book.coverFileUrl}')),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    'Name: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(_cart[index].book.bookName.length > 22
                      ? "${_cart[index].book.bookName}".substring(0, 22) + '...'
                      : "${_cart[index].book.bookName}"),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Author: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (_cart[index].book.authors != null)
                    Text(_cart[index].book.authors.length > 22
                        ? "${_cart[index].book.authors}".substring(0, 22) +
                            '...'
                        : "${_cart[index].book.authors}")
                  else
                    Text('-'),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Supllier: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("${_cart[index].supplierName}"),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Weight: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("${_cart[index].book.weight} кг"),
                ],
              ),
              Row(
                children: [
                  Text(
                    'total: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("${_cart[index].total}"),
                ],
              ),
            ],
          ),
        ),
        IconButton(
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
                content: Text('remove book'),
                onConfirm: () {
                  var data = box.read('addCardList');
                  data.removeAt(index);
                  _myCC.addCartList.removeAt(index);
                  box.write('addCardList', data);
                  Get.back();
                  Get.snackbar('success', 'removed to cart',
                      snackPosition: SnackPosition.BOTTOM);
                });
          },
          icon: Icon(Icons.remove_shopping_cart),
        )
      ],
    ),
  );
}
