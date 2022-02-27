import 'package:book_store_app/views/pages/Book_Details/book_details_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookdetailsView extends GetView<BookDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Book Details'),
        ),
        body: controller.obx(
          (_book) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    'https://${_book[0].coverFileUrl}',
                    height: 250,
                  ),
                  Text(_book[0].bookName.length > 100
                      ? "Name :- ${_book[0].bookName}".substring(0, 100) + '...'
                      : "Name :- ${_book[0].bookName}"),
                  Text("ISBN No. :- ${_book[0].isbn}"),
                  Text("Authors :- ${_book[0].authors}"),
                  Text("Publisher :- ${_book[0].publisher}"),
                  Text("Year :- ${_book[0].year}"),
                  Text("Pages :- ${_book[0].numberOfPages}"),
                  Text("Size :- ${_book[0].size}"),
                  Text("Weight :- ${_book[0].weight}"),
                  if (_book[0].annotation.length == 0) ...[
                    Text(_book[0].annotation.length > 100
                        ? "Publisher :- ${_book[0].annotation}"
                                .substring(0, 100) +
                            '...'
                        : "Publisher :- ${_book[0].annotation}"),
                  ],
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                    ),
                    child: Container(
                      child: Text('add to cart'),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
