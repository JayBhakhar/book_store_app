import 'package:book_store_app/views/pages/Suggestion_Books/suggestion_books_controller.dart';
import 'package:book_store_app/views/widgets/book_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuggestionBooksView extends GetView<SuggestionBooksController> {
  final suggestionBooksController = Get.find<SuggestionBooksController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('hi'),
        ),
        body: controller.obx(
          (_book) => GridView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: _book.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400.0,
              mainAxisExtent: 250,
              crossAxisSpacing: 0.5,
              mainAxisSpacing: 0.5,
            ),
            itemBuilder: (BuildContext context, index) {
              return bookCard(_book, index);
            },
          ),
        ));
  }
}
