import 'package:book_store_app/models/Order.dart';
import 'package:flutter/material.dart';

Widget orderCard(List<Order> orderList, index) {
  return InkWell(
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Text('book name'),
          Text('post :- ${orderList[index].post}'),
          Text('status :- ${orderList[index].status}'),
          Text('total :- ${orderList[index].total}'),
          Text('supplier :- ${orderList[index].supplierName}'),
        ],
      ),
    ),
    onTap: () {
      print('my order card button');
    },
  );
}
