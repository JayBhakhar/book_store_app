import 'package:book_store_app/models/Order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget orderCard(RxList<Order> orderList, index) {
  return InkWell(
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 90,
                  width: 70,
                  child:
                      Image.network('https://${orderList[index].bookImage}')),
            )
          ]),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Book Name: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(orderList[index].bookName.length > 25
                        ? "${orderList[index].bookName}".substring(0, 25) +
                            '...'
                        : "${orderList[index].bookName}")
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
                    Text(orderList[index].bookAuthor),
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
                    Text(orderList[index].post),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Status: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(orderList[index].status),
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
                    Text(orderList[index].total),
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
                    Text(orderList[index].supplierName),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
    onTap: () {
      // print(orderList[index].id);
      print('order tracking screen');
    },
  );
}
