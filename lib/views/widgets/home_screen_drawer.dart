import 'package:book_store_app/models/User.dart';
import 'package:book_store_app/utils/token.dart';
import 'package:book_store_app/views/pages/Add_Book/add_book.dart';
import 'package:book_store_app/views/pages/Cart/cart.dart';
import 'package:book_store_app/views/pages/Confirm_Seller_List/cofirm_seller_list.dart';
import 'package:book_store_app/views/pages/Login/login.dart';
import 'package:book_store_app/views/pages/My_Books/my_books.dart';
import 'package:book_store_app/views/pages/Seller_Requests_List/seller_requests.dart';
import 'package:flutter/material.dart';

class HomeScreenDrawer extends StatelessWidget {
  final List<User> user;
  HomeScreenDrawer({this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  Text('${user[0].userName}'),
                  Text('${user[0].email}'),
                  Text('${user[0].phone_number}'),
                  Text('${user[0].address}'),
                  Text('${user[0].admin}'),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('My cart'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cart(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.reorder),
              title: Text('My Order'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Builder(builder: (context) {
              if (user[0].admin)
                return ExpansionTile(
                  leading: Icon(Icons.admin_panel_settings),
                  title: Text('I am admin'),
                  children: [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Confirm Sellers List'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmSellerList(),
                            // Sellers List screen
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.person_add),
                      title: Text('Sellers Requests'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SellerRequests(),
                            // Sellers List requst
                          ),
                        );
                      },
                    ),
                  ],
                );
              else
                return Container(
                  width: 0,
                  height: 0,
                );
            }),
            Builder(builder: (context) {
              if (user[0].confirm_seller) {
                return ExpansionTile(
                  leading: Icon(Icons.add_shopping_cart),
                  title: Text('I am seller'),
                  children: [
                    ListTile(
                      leading: Icon(Icons.add_box_outlined),
                      title: Text('Add a book'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddBook(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.book),
                      title: Text('My books'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyBooks(),
                          ),
                        );
                      },
                    ),
                  ],
                );
              } else
                return Container();
            }),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign out'),
              onTap: () {
                Token().removeToken();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
