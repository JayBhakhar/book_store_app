import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/views/widgets/your_book_card.dart';
import 'package:flutter/material.dart';

class MyBooks extends StatelessWidget {
  List<Book> my_books;
  MyBooks({@required this.my_books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Books'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GridView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: my_books.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400.0,
              mainAxisExtent: 75,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 0.1,
            ),
            itemBuilder: (BuildContext context, index) {
              return YourBooksCard(
                context,
                my_books,
                index,
              );
            },
          ),
        ),
      ),
    );
  }
}
