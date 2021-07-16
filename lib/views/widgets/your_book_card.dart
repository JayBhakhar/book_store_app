import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/views/pages/Edit_Book/edit_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourBooksCard extends StatelessWidget {
  SharedPreferences prefs;
  final List<Book> books_list;
  final int index;

  YourBooksCard({this.books_list, this.index});

  _removebook() async{
    prefs = await SharedPreferences.getInstance();
    print('${prefs.getString('token')}');
    final url = Uri.parse('$apiBaseURL/book');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'x-access-token': '${prefs.getString('token')}'
    };
    String json = '{"book_id": "${books_list[index].book_id}" }';
    Response response = await delete(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    print(statusCode);
    // this API passes back the id of the new item added to the body
    String body = response.body;
    print(body);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Image.asset('assets/images/image.jpg'),
            title: Text(
                '${books_list[index].bookName}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Price :- \$ ${books_list[index].price}'),
                Text('Quatity :- ${books_list[index].quantity}'),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  child: const Text('Edit'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditBook(
                          bookID: '${books_list[index].book_id}',
                        ),
                      ),
                    );
                  },
                ),
                TextButton(
                  child: const Text('Remove'),
                  onPressed: () {
                    _removebook();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
