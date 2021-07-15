import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/views/widgets/your_book_card.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourBooks extends StatefulWidget {
  @override
  _YourBooksState createState() => _YourBooksState();
}

class _YourBooksState extends State<YourBooks> {
  void initState() {
    super.initState();
    _getSellerBooks();
  }

  SharedPreferences prefs;
  List<Book> books;

  _getSellerBooks() async {
    prefs = await SharedPreferences.getInstance();
    print('${prefs.getString('token')}');
    final url = Uri.parse('http://192.168.0.112:5000/seller/books');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'x-access-token': '${prefs.getString('token')}'
    };
    // make Get request
    Response response = await get(url, headers: headers);
    // check the status code for the result
    int statusCode = response.statusCode;
    print(statusCode);
    // this API passes back the id of the new item added to the body
    String body = response.body;
    print(jsonDecode(body));
    if (statusCode == 200) {
      var booksObjs = jsonDecode(body)['sellerBook'] as List;
      setState(() {
        books = booksObjs.map((bookJson) => Book.fromJson(bookJson)).toList();
      });
    }
    print(jsonDecode(body)['sellerBook']);
    print(books[0]);
  }
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
