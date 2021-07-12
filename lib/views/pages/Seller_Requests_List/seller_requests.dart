import 'dart:convert';
import 'package:book_store_app/models/User.dart';
import 'package:book_store_app/views/widgets/seller_requests_list_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SellerRequests extends StatefulWidget {
  @override
  _SellerRequestsState createState() => _SellerRequestsState();
}

class _SellerRequestsState extends State<SellerRequests> {
  SharedPreferences prefs;
  List<User> newSellers;

  void initState() {
    super.initState();
    _getSellers();
  }

  _getSellers() async {
    prefs = await SharedPreferences.getInstance();
    print('${prefs.getString('token')}');
    final url = Uri.parse('http://192.168.0.112:5000/admin/newSellers');
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
      var userObjs = jsonDecode(body)['newSellers'] as List;
      setState(() {
        newSellers =
            userObjs.map((bookJson) => User.fromJson(bookJson)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller Requests List'),
      ),
      body:
      GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: newSellers.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 450.0,
          mainAxisExtent: 145,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
        ),
        itemBuilder: (BuildContext context, index) {
          return SellerRequestsListCard(
            sellers_list: newSellers,
            index: index,
          );
        },
      ),
    );
  }
}

