import 'package:book_store_app/views/pages/Add_Book/add_book.dart';
import 'package:book_store_app/views/pages/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _removeToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
}


class HomeScreenDrawer extends StatelessWidget {
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
              child: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('My cart'),
              onTap: () {
                // Update the state of the app.
                // ...
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
            ExpansionTile(
              leading: Icon(Icons.admin_panel_settings ),
              title: Text('I am admin'),
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Sellers List'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddBook(),
                        // Sellers List screen
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person_add),
                  title: Text('Sellers List'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddBook(),
                        // Sellers List requst
                      ),
                    );
                  },
                ),
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.add_shopping_cart ),
              title: Text('I am seller'),
              children: [
                ListTile(
                  leading: Icon(Icons.book),
                  title: Text('Add a book'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddBook(),
                      ),
                    );
                  },
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign out'),
              onTap: () {
                _removeToken();
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
