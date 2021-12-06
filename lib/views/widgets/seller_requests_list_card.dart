import 'dart:convert';
import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget SellerRequestsListCard(
  BuildContext context,
  final List<User> sellers_list,
  final int index,
) {
  SharedPreferences prefs;
  _addConfirmSeller() async {
    prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('$apiBaseURL/newSellers');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'x-access-token': '${prefs.getString('token')}'
    };
    // String json = '{"user_id": "${sellers_list[index].user_id}" }';
    String json = '{"user_id": "${sellers_list[index]}" }';
    Response response = await put(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    var message = jsonDecode(response.body)['message'];
    print(message);
  }

  _removeSellerRequest() async {
    prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('$apiBaseURL/confirm_seller');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'x-access-token': '${prefs.getString('token')}'
    };
    String json = '{"user_id": "${sellers_list[index]}" }';
    // String json = '{"user_id": "${sellers_list[index].user_id}" }';
    print(json);
    Response response = await put(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    print(statusCode);
    // this API passes back the id of the new item added to the body
    var message = jsonDecode(response.body)['message'];
    print(message);
    // todo: somewhere need to show
  }

  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          title: Text('${sellers_list[index]}'),
          // title: Text('${sellers_list[index].userName}'),
          subtitle: Text(
            ''),
            //   '${sellers_list[index].email} (${sellers_list[index].phone_number})\n'
            //   '${sellers_list[index].address}, ${sellers_list[index].city}, ${sellers_list[index].country}'),
          isThreeLine: true,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              child: const Text('ADD'),
              onPressed: () {
                _addConfirmSeller();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Added To Confirm Sellers'),
                  ),
                );
              },
            ),
            TextButton(
              child: const Text('REMOVE'),
              onPressed: () {
                _removeSellerRequest();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Remove from Seller Requests lists'),
                  ),
                );
              },
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    ),
  );
}
