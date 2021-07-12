import 'package:book_store_app/models/User.dart';
import 'package:flutter/material.dart';


class SellerRequestsListCard extends StatelessWidget {
  final List<User> sellers_list;
  final int index;

  SellerRequestsListCard({this.sellers_list, this.index});

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
                child: const Text('ADD'),
                onPressed: () {
                  _addConfirmSeller();
                  /* ... */
                  // ${sellers_list[index].seller_id}  <-- seller id
                  // for add to confirm seller
                },
              ),
              TextButton(
                child: const Text('REMOVE'),
                onPressed: () {
                  _removeSellerRequest();
                  /* ... */
                  // ${sellers_list[index].seller_id}  <-- seller id
                  // for remove to seller
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