import 'dart:convert';

import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/Book.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

Widget CartCard(
  BuildContext context,
  final List items,
  final List<Book> book,
) {
  SharedPreferences prefs;
  _remove_item(int index) async {
    prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('$apiBaseURL/cart');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'x-access-token': '${prefs.getString('token')}'
    };
    String json = '{"_id": "${items[index]['item_id']}" }';
    Response response = await delete(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;
    Map<String, dynamic> message = jsonDecode(body);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message['message']),
    ));
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => Cart(),
    //   ),
    // );
    //Rebuilt widget
  }

  return ListView.builder(
      itemCount: items.length,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                leading: Image(
                  image: AssetImage('assets/images/image.jpg'),
                ),
                title: Text('${book[index].bookName}'),
                // subtitle: Text('${book[index].sellerName}'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('REMOVE'),
                    onPressed: () {
                      _remove_item(index);
                    },
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        );
      });
}
