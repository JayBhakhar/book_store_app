import 'dart:convert';
import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/utils/ProgressIndicatorLoader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

class BookDetails extends StatefulWidget {
  String bookID;
  BookDetails({this.bookID});

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  void initState() {
    super.initState();
    _getBook();
  }

  SharedPreferences prefs;
  List<Book> book = [];
  bool isLoading = false;

  _getBook() async {
    setState(() {
      isLoading = true;
    });
    final url = Uri.parse('$apiBaseURL/book');
    prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'x-access-token': '${prefs.getString('token')}',
      'book_id': widget.bookID
    };
    // make Post request
    Response response = await get(url, headers: headers);
    // check the status code for the result
    int statusCode = response.statusCode;
    print(statusCode);
    // this API passes back the id of the new item added to the body
    String body = response.body;
    if (statusCode == 200) {
      var booksObjs = jsonDecode(body)['book'] as List;
      setState(() {
        book = booksObjs.map((bookJson) => Book.fromJson(bookJson)).toList();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ImageSlideshow(
                      width: double.infinity,
                      height: 200,
                      initialPage: 0,
                      indicatorColor: Colors.blue,
                      indicatorBackgroundColor: Colors.grey,
                      children: [
                        Image.asset(
                          'assets/images/image.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/images/image2.jpg',
                          fit: BoxFit.cover,
                        ),
                      ],
                      autoPlayInterval: 10000,
                    ),
                    Text('Book name :- ${book[0].bookName}'),
                    Text('Author :- ${book[0].authors}'),
                    Text('illustrators :- ${book[0].illustrators}'),
                    Text('interpreters :- ${book[0].interpreters}'),
                    Text('publisher :- ${book[0].publisher}'),
                    Text('originalLanguage :- ${book[0].originalLanguage}'),
                    Text('year :- ${book[0].year} '),
                    Text('ISBN :- ${book[0].ISBN}'),
                    Text('EAN :- ${book[0].EAN}'),
                    Text('ISSN :- ${book[0].ISSN}'),
                    Text('numberOfPages :- ${book[0].numberOfPages}'),
                    Text('height :- ${book[0].height}'),
                    Text('width :- ${book[0].width}'),
                    Text('length :- ${book[0].length}'),
                    Text('weight :- ${book[0].weight}'),
                    Text('price :- ${book[0].price}'),
                    Text('quantity :- ${book[0].quantity}'),
                    Text('sellerBookID :- ${book[0].sellerBookID}'),
                    Text('briefAnnotation :- ${book[0].briefAnnotation}'),
                    Text('longAnnotation :- ${book[0].longAnnotation}'),
                    Text('cover_type :- ${book[0].coverType}'),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                      ),
                      child: Container(
                        child: Text('add to cart'),
                      ),
                      onPressed: () {
                        // ${book[0].book_id} <-- book id
                        // ${book[0].seller_id} <-- seller id
                        // ${book[0].sellerBookID} <-- seller book id
                        // item add to cart
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          ProgressIndicatorLoader(
            color: Colors.white,
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}
