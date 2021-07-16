import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/services/book_api.dart';
import 'package:book_store_app/views/widgets/your_book_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyBooks extends StatefulWidget {
  @override
  _MyBooksState createState() => _MyBooksState();
}

class _MyBooksState extends State<MyBooks> {
  void initState() {
    super.initState();
    BookAPI().getSellerBooks().then((List<Book> _sellerBook){
      setState(() {
        books = _sellerBook;
      });
    });
  }

  SharedPreferences prefs;
  List<Book> books;

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
            itemCount: books.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400.0,
              mainAxisExtent: 75,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 0.1,
            ),
            itemBuilder: (BuildContext context, index) {
              return YourBooksCard(
                books_list: books,
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}
