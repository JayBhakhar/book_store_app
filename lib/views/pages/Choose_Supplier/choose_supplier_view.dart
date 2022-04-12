import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/views/pages/Choose_Supplier/choose_supplier_controller.dart';
import 'package:book_store_app/views/widgets/choose_supplier_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseSupplierView extends GetView<ChooseSupplierController> {
  @override
  Widget build(BuildContext context) {
    var arg = Get.arguments;
    final List<Book> _book = arg['book'];
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 3),
            bookCardSupplier(_book),
            SizedBox(height: 3),
            controller.obx(
              (state) => GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400.0,
                  mainAxisExtent: 110,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                itemBuilder: (BuildContext context, index) {
                  return chooseSupplierCard(state, _book,index );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget bookCardSupplier(List<Book> _book) {
  return Card(
    child: Container(
      width: 400,
      height: 150,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 100,
                child: Image.network('https://${_book[0].coverFileUrl}')),
          ),
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
                    Text(_book[0].bookName.length > 27
                        ? "${_book[0].bookName}".substring(0, 27) + '...'
                        : "${_book[0].bookName}"),
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
                    Text(_book[0].authors.length > 27
                        ? "${_book[0].authors}".substring(0, 27) + '...'
                        : "${_book[0].authors}"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
