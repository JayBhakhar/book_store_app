import 'dart:convert';
import 'dart:io';
import 'package:book_store_app/views/pages/Book_Details/book_details.dart';
import 'package:book_store_app/views/widgets/Custom_Card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Book {
  String book_id;
  String bookName;
  String authors;
  int price;

  Book(this.book_id, this.bookName, this.authors, this.price);

  factory Book.fromJson(dynamic json) {
    return Book(
      json['_id'] as String,
      json['bookName'] as String,
      json['authors'] as String,
      json['price'] as int,
    );
  }

  @override
  String toString() {
    return '{ ${this.book_id}, ${this.bookName}, ${this.authors}, ${this.price} }';
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _getBooks();
  }

  SharedPreferences prefs;
  List<Book> books;

  _getBooks() async {
    prefs = await SharedPreferences.getInstance();
    print('${prefs.getString('token')}');
    final url = Uri.parse('http://192.168.0.112:5000/books');
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
      var booksObjs = jsonDecode(body)['books'] as List;
      setState(() {
        books = booksObjs.map((bookJson) => Book.fromJson(bookJson)).toList();
      });
    }
    print(jsonDecode(body)['books']);
    print(books[0]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Search Book",
              prefixIcon: Icon(Icons.search),
            ),
            onSubmitted: null,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: books.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisExtent: 230,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
        ),
        itemBuilder: (BuildContext context, index) {
          return CustomCard(
            books_list: books,
            index: index,
          );
        },
      ),
    );
  }
}
