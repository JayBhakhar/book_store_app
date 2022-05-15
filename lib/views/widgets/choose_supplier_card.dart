import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/models/ChooseSupplier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Widget chooseSupplierCard(
    List<ChooseSupplier> chooseSupplier, List<Book> book, int index) {
  return Card(
    child: Row(
      children: [
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Supplier: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(chooseSupplier[index].supplier),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Price: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(chooseSupplier[index].supplierPrice.toString()),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Deliery Charge: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(chooseSupplier[index].deliveryCharge.toString()),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Post: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(chooseSupplier[index].deliveryName.toString()),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Deliery time: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(chooseSupplier[index].deliveryTime < 2
                      ? "${chooseSupplier[index].deliveryTime} day"
                      : "${chooseSupplier[index].deliveryTime} days"),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Total: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    (chooseSupplier[index].deliveryCharge +
                            chooseSupplier[index].supplierPrice)
                        .toString(),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 100,
          child: IconButton(
            onPressed: () {
              GetStorage box = GetStorage();
              var data = box.read('addCardList');
              Map<String, dynamic> body = {
                "book": book[0],
                "supplier_name": "${chooseSupplier[index].supplier}",
                "supplier_book_id": chooseSupplier[index].supplierBookID,
                "total": (chooseSupplier[index].deliveryCharge +
                    chooseSupplier[index].supplierPrice),
                "post": "${chooseSupplier[index].deliveryName}"
              };
              data.add(body);
              box.write('addCardList', data);
              Get.snackbar('success', 'added to cart',
                  snackPosition: SnackPosition.BOTTOM);
            },
            icon: Icon(
              Icons.add_shopping_cart,
            ),
          ),
        )
      ],
    ),
  );
}
