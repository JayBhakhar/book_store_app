import 'package:book_store_app/models/User.dart';
import 'package:book_store_app/services/user_api.dart';
import 'package:book_store_app/views/widgets/seller_requests_list_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SellerRequests extends StatefulWidget {
  @override
  _SellerRequestsState createState() => _SellerRequestsState();
}

class _SellerRequestsState extends State<SellerRequests> {
  SharedPreferences prefs;
  List<User> newSellers = [];

  void initState() {
    super.initState();
    UserAPI().getSellers().then((List<User> _seller){
      newSellers = _seller;
    });
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

