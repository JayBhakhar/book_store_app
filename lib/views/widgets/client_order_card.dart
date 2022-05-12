import 'package:book_store_app/models/Order.dart';
import 'package:flutter/material.dart';

Widget clientOrderCard(List<Order> orderList, index) {
  return InkWell(
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Text('book name'),
          Text('post :- ${orderList[index].post}'),
          Text('status :- ${orderList[index].status}'),
          Text('supplier Book Id :- ${orderList[index].supplierBookId}'),
          Text('total :- ${orderList[index].total}'),
          Text('client name :- ${orderList[index].clientName}'),
          Text('client phone number :- ${orderList[index].clientPhoneNumber}'),
          Text('client address :- ${orderList[index].clientAddress}'),
          Text('client city :- ${orderList[index].clientCity}'),
          Text('client zip code :- ${orderList[index].clientZipCode}'),
        ],
      ),
    ),
    onTap: () {
      print('client card button');
    },
  );
}
