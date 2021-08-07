import 'package:book_store_app/models/User.dart';
import 'package:book_store_app/services/user_api.dart';
import 'package:book_store_app/views/widgets/seller_requests_list_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SellerRequests extends StatelessWidget {
  final List<User> seller_requests;
  SellerRequests({this.seller_requests});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller Requests List'),
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: seller_requests.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 450.0,
            mainAxisExtent: 145,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
          ),
          itemBuilder: (BuildContext context, index) {
            return SellerRequestsListCard(
              context,
              seller_requests,
              index,
            );
          },
        ),
      ),
    );
  }
}

