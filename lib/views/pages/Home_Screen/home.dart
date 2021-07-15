import 'dart:convert';
import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/utils/ProgressIndicatorLoader.dart';
import 'package:book_store_app/views/widgets/book_card.dart';
import 'package:book_store_app/views/widgets/home_screen_drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _getBooks();
  }
  bool isLoading = false;
  SharedPreferences prefs;
  List<Book> books;

  _getBooks() async {
    setState(() {
      isLoading = true;
    });
    prefs = await SharedPreferences.getInstance();
    print('${prefs.getString('token')}');
    final url = Uri.parse('$apiBaseURL/books');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'x-access-token': '${prefs.getString('token')}'
    };
    // make Get request
    Response response = await get(url, headers: headers);
    // check the status code for the result
    int statusCode = response.statusCode;
    print(statusCode);
    // this API passes back the id of the new item added to the body
    String body = response.body;
    print(jsonDecode(body));
    if (statusCode == 200) {
      var booksObjs = jsonDecode(body)['books'] as List;
      setState(() {
        books = booksObjs.map((bookJson) => Book.fromJson(bookJson)).toList();
        isLoading = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // need to change
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
            itemCount: books.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisExtent: 180,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
            ),
            itemBuilder: (BuildContext context, index) {
              return BookCard(
                books_list: books,
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
