import 'dart:convert';

import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/Book.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

class CartCard extends StatefulWidget {
  List items;
  List<Book> book;
  CartCard({this.items, this.book});

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  List<Book> book;
  SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.items.length,
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
                  title: Text('${widget.book[index].bookName}'),
                  subtitle: Text('${widget.book[index].sellerName}'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('REMOVE'),
                      onPressed: () async {
                        prefs = await SharedPreferences.getInstance();
                        final url = Uri.parse('$apiBaseURL/cart');
                        Map<String, String> headers = {
                          "Content-type": "application/json",
                          'x-access-token': '${prefs.getString('token')}'
                        };
                        String json =
                            '{"_id": "${widget.items[index]['item_id']}" }';
                        print(json);
                        Response response =
                            await delete(url, headers: headers, body: json);
                        // check the status code for the result
                        int statusCode = response.statusCode;
                        print(statusCode);
                        // this API passes back the id of the new item added to the body
                        String body = response.body;
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
}
