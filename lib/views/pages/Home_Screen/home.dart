import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/utils/ProgressIndicatorLoader.dart';
import 'package:book_store_app/views/widgets/book_card.dart';
import 'package:book_store_app/views/widgets/home_screen_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  List<Book> books;
  Home({this.books});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  bool isLoading = false;

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
      drawer: HomeScreenDrawer(),
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
                books_list: widget.books,
                index: index,
              );
            },
          ),
          ProgressIndicatorLoader(Colors.white, isLoading)
        ],
      ),
    );
  }
}
