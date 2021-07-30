import 'dart:convert';
import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/User.dart';
import 'package:book_store_app/views/widgets/confirm_seller_list_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ConfirmSellerList extends StatefulWidget {
  @override
  _ConfirmSellerListState createState() => _ConfirmSellerListState();
}

class _ConfirmSellerListState extends State<ConfirmSellerList> {
  SharedPreferences prefs;
  List<User> sellers;

  void initState() {
    super.initState();
    _getSellers();
  }

  _getSellers() async {
    prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('$apiBaseURL/confirm_sellers');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'x-access-token': '${prefs.getString('token')}'
    };
    // make Post request
    Response response = await get(url, headers: headers);
    // check the status code for the result
    int statusCode = response.statusCode;
    print(statusCode);
    // this API passes back the id of the new item added to the body
    String body = response.body;
    if (statusCode == 200) {
      var userObjs = jsonDecode(body)['sellers'] as List;
      setState(() {
        sellers =
            userObjs.map((bookJson) => User.fromJson(bookJson)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Sellers List'),
      ),
      body:
      GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: sellers.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 450.0,
          mainAxisExtent: 145,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
        ),
        itemBuilder: (BuildContext context, index) {
          return ConfirmSellerListCard(
            sellers_list: sellers,
            index: index,
          );
        },
      ),
    );
  }
}

