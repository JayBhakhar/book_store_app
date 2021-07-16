import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/models/User.dart';
import 'package:book_store_app/services/user_api.dart';
import 'package:book_store_app/utils/ProgressIndicatorLoader.dart';
import 'package:book_store_app/views/widgets/book_card.dart';
import 'package:book_store_app/views/widgets/home_screen_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final List<Book> books;
  Home({this.books});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    UserAPI().getCurrentUser().then((List<User> _user) {
      setState(() {
        user = _user;
      });
    });
  }

  bool isLoading = false;
  List<User> user = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // need to change
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Search Book",
              prefixIcon: Icon(Icons.search),
            ),
            onSubmitted: null,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: HomeScreenDrawer(user: user),
      body: Stack(
        children: [
          GridView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.books.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisExtent: 180,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
            ),
            itemBuilder: (BuildContext context, index) {
              return BookCard(
                index: index,
              );
            },
          ),
          ProgressIndicatorLoader(
            color: Colors.white,
            isLoading: isLoading,
          )
        ],
      ),
    );
  }
}
