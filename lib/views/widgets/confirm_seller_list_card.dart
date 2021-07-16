import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ConfirmSellerListCard extends StatelessWidget {
  final List<User> sellers_list;
  final int index;

  ConfirmSellerListCard({this.sellers_list, this.index});

  SharedPreferences prefs;

  _removeConfirmSeller() async{
    prefs = await SharedPreferences.getInstance();
    print('${prefs.getString('token')}');
    final url = Uri.parse('$apiBaseURL/confirm_seller');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'x-access-token': '${prefs.getString('token')}'
    };
    String json = '{"_id": "${sellers_list[index].user_id}" }';
    print(json);
    Response response = await put(url, headers: headers, body: json);
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
            title: Text('${sellers_list[index].userName}'),
            subtitle: Text('${sellers_list[index].email} (${sellers_list[index].phone_number})\n'
                '${sellers_list[index].address}, ${sellers_list[index].city}, ${sellers_list[index].country}'),
            isThreeLine: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('REMOVE'),
                onPressed: () {
                  _removeConfirmSeller();
                  /* ... */
                  // ${sellers_list[index].seller_id}  <-- seller id
                  // for remove confirm seller
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}