import 'dart:convert';

import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/views/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  SharedPreferences prefs;
  List items = [];
  List<Book> book = [];
  bool isLoading = false;
  void initState() {
    super.initState();
    _getCart();
  }

  _getCart() async {
    setState(() {
      isLoading = true;
    });
    final url = Uri.parse('$apiBaseURL/cart');
    prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'x-access-token': '${prefs.getString('token')}'
    };
    // make Post request
    Response response = await get(url, headers: headers);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;
    setState(() {
      items = jsonDecode(body)['cart'];
    });
    if (statusCode == 200) {
      var _items = jsonDecode(body)['cart'];
      for (var bookID in _items) {
        final url = Uri.parse('$apiBaseURL/book');
        prefs = await SharedPreferences.getInstance();
        Map<String, String> headers = {
          'Content-type': 'application/json',
          'x-access-token': '${prefs.getString('token')}',
          'book_id': bookID['bookID'].toString()
        };
        // make Post request
        Response response = await get(url, headers: headers);
        // check the status code for the result
        int statusCode = response.statusCode;
        // this API passes back the id of the new item added to the body
        String body = response.body;
        if (statusCode == 200) {
          var booksObjs = jsonDecode(body)['book'] as List;
          setState(() {
            book.add(booksObjs
                .map((bookJson) => Book.fromJson(bookJson))
                .toList()
                .first);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: SingleChildScrollView(
        child: CartCard(
          items: items,
          book: book,
        ),
      ),
    );
  }
}
