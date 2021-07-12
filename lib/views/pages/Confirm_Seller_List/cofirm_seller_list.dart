import 'dart:convert';

import 'package:book_store_app/views/widgets/confirm_seller_list_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sellers {
  String seller_id;
  String userName;
  String email;
  String phone_number;
  String address;
  String passsword;
  int city;
  int country;
  int postindex;
  bool confirm_seller;

  Sellers(
    this.seller_id,
    this.userName,
    this.email,
    this.phone_number,
    this.address,
    this.passsword,
    this.city,
    this.country,
    this.postindex,
    this.confirm_seller,
  );

  factory Sellers.fromJson(dynamic json) {
    return Sellers(
      json['_id'] as String,
      json['userName'] as String,
      json['email'] as String,
      json['phoneNumber'] as String,
      json['address'] as String,
      json['passsword'] as String,
      json['city'] as int,
      json['country'] as int,
      json['postindex'] as int,
      json['confirmSeller'] as bool,
    );
  }

  @override
  String toString() {
    return '{ ${this.seller_id}, ${this.userName}, ${this.email}, ${this.phone_number},'
        '${this.address}, ${this.passsword}, ${this.city}, ${this.country},'
        '${this.postindex},${this.confirm_seller},'
        '}';
  }
}

class ConfirmSellerList extends StatefulWidget {
  @override
  _ConfirmSellerListState createState() => _ConfirmSellerListState();
}

class _ConfirmSellerListState extends State<ConfirmSellerList> {
  SharedPreferences prefs;
  List<Sellers> sellers;

  void initState() {
    super.initState();
    _getSellers();
  }

  _getSellers() async {
    prefs = await SharedPreferences.getInstance();
    print('${prefs.getString('token')}');
    final url = Uri.parse('http://192.168.0.112:5000/confirm_sellers');
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
            userObjs.map((bookJson) => Sellers.fromJson(bookJson)).toList();
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

