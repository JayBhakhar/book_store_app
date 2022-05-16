import 'dart:ui';
import 'package:book_store_app/models/Order.dart';
import 'package:book_store_app/services/api_services.dart';
import 'package:book_store_app/views/pages/Order/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget clientOrderCard(RxList<Order> orderList, index) {
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
                    InkWell(
                      child: Text(
                        orderList[index].status,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {
                        OrderController _ordC = Get.find();
                        Get.defaultDialog(
                          title: "Status",
                          backgroundColor: Colors.white,
                          titleStyle: TextStyle(color: Colors.black),
                          textConfirm: "change status",
                          textCancel: "Cancel",
                          cancelTextColor: Colors.black,
                          confirmTextColor: Colors.white,
                          buttonColor: Colors.blueAccent,
                          barrierDismissible: true,
                          content: Obx(
                            () => Column(
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      value: "not sent yet",
                                      groupValue:
                                          _ordC.selectedOrderStatus.value,
                                      onChanged: (value) {
                                        _ordC.onChangeOrderStatus(value);
                                      },
                                    ),
                                    Text('not sent yet'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: "order sent",
                                      groupValue:
                                          _ordC.selectedOrderStatus.value,
                                      onChanged: (value) {
                                        _ordC.onChangeOrderStatus(value);
                                      },
                                    ),
                                    Text("order sent")
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onConfirm: () async {
                            String jsonBody = '{"id":"${orderList[index].id}",'
                                '"status":"${_ordC.selectedOrderStatus.value}"}';
                            ApiServices().putOrderRequst(jsonBody);
                            _ordC.orderList =
                                await ApiServices().getOrderRequst(true);
                            Get.delete<OrderController>();
                            Get.offNamed('/home');
                          },
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Supplier Book ID : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(orderList[index].supplierBookId.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Client: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Get.defaultDialog(
                            title: "Client Details",
                            backgroundColor: Colors.white,
                            titleStyle: TextStyle(color: Colors.black),
                            barrierDismissible: true,
                            content: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Name: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(orderList[index].clientName),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Email: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(orderList[index].clientEmail),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Address: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(orderList[index].clientAddress),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Zip Code: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(orderList[index].clientZipCode),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Phone Number: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(orderList[index].clientPhoneNumber),
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
                              ],
                            ),
                          );
                        },
                        child: Text(
                          orderList[index].clientName,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        )), // diolog for show details of client
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
    onTap: () {
      print('screen for change status and clients details');
    },
  );
}
