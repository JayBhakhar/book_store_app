import 'package:book_store_app/models/User.dart';
import 'package:book_store_app/views/widgets/confirm_seller_list_card.dart';
import 'package:flutter/material.dart';

class ConfirmSellerList extends StatelessWidget {
  final List<User> confirmSellers;
  ConfirmSellerList({this.confirmSellers}); 
  @override
  Widget build(BuildContext context) {
    if (confirmSellers.length != 0) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Confirm Sellers List'),
        ),
        body: GridView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: confirmSellers.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 450.0,
            mainAxisExtent: 145,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
          ),
          itemBuilder: (BuildContext context, index) {
            return ConfirmSellerListCard(
              context,
              confirmSellers,
              index,
            );
          },
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('No Confirm Seller, List is Empty'),
        ),
      );
    }
  }
}
