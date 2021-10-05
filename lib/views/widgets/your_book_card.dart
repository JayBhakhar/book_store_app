import 'dart:convert';
import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/views/pages/Edit_Book/edit_book.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget YourBooksCard(
  BuildContext context,
  final List<Book> book,
  final int index,
) {
  SharedPreferences prefs;
  Future<List<Book>> _get_edit_book() async {
    prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('$apiBaseURL/book');
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'x-access-token': '${prefs.getString('token')}',
      'book_id': '${book[index].bookID}'
    };
    // make Post request
    Response response = await get(url, headers: headers);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;
    if (statusCode == 200) {
      var booksObjs = jsonDecode(body)['book'] as List;
      return booksObjs.map((bookJson) => Book.fromJson(bookJson)).toList();
    }
  }

  _removebook() async {
    prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('$apiBaseURL/book');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'x-access-token': '${prefs.getString('token')}'
    };
    String json = '{"book_id": "${book[index].bookID}" }';
    Response response = await delete(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    var message = jsonDecode(response.body)['message'];
    print(message);
    // todo: if need to show
  }

  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Image.asset('assets/images/image.jpg'),
          title: Text('${book[index].bookName}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text('Price :- \$ ${book[index].priceOfSupplier}'),
              // Text('Quatity :- ${book[index].quantity}'),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                child: const Text('Edit'),
                onPressed: () {
                  _get_edit_book().then((List<Book> book) {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => EditBook(
                    //       book: book,
                    //     ),
                    //   ),
                    // );
                  });
                },
              ),
              TextButton(
                child: const Text('Remove'),
                onPressed: () {
                  _removebook();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Book removed !!'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
