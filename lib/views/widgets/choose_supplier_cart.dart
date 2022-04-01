import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/models/ChooseSupplier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget chooseSupplierCard(
    List<ChooseSupplier> chooseSupplier, List<Book> book, int index) {
  return Card(
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.network('https://${book[0].coverFileUrl}'),
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(height: 3),
              Row(
                children: [
                  Text(
                    'Name: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(book[0].bookName.length > 27
                      ? "${book[0].bookName}".substring(0, 27) + '...'
                      : "${book[0].bookName}"),
                ],
              ),
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
                  Text((chooseSupplier[index].deliveryCharge +
                          chooseSupplier[index].supplierPrice)
                      .toString()),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
