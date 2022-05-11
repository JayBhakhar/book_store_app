import 'package:book_store_app/models/Book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget bookCard(List<Book> _book, int index) {
  return InkWell(
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Image.network(src)
                  Container(
                    width: 150,
                    height: 120,
                    child:
                        Image.network('https://${_book[index].coverFileUrl}'),
                  ),
                  Text(_book[index].bookName.length > 25
                      ? "${_book[index].bookName}".substring(0, 25) + '...'
                      : "${_book[index].bookName}"),
                  Text('${_book[index].authors}'),
                ],
              ),
            ),
          )
        ],
      ),
    ),
    onTap: () {
      Get.toNamed('/bookdetails', arguments: _book[index].bookID);
    },
  );
}
