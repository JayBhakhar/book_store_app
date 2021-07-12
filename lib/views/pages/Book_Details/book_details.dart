import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

class Book {
  String book_id;
  String seller_id;
  String bookName;
  String authors;
  String illustrators;
  String interpreters;
  String publisher;
  String originalLanguage;
  int year;
  int ISBN;
  int EAN;
  int ISSN;
  int numberOfPages;
  int height;
  int width;
  int length;
  int weight;
  int price;
  int quantity;
  int sellerBookID;
  String briefAnnotation;
  String longAnnotation;
  String coverType;
  String sellerName;

  Book(
    this.book_id,
    this.seller_id,
    this.bookName,
    this.authors,
    this.illustrators,
    this.interpreters,
    this.publisher,
    this.originalLanguage,
    this.year,
    this.ISBN,
    this.EAN,
    this.ISSN,
    this.numberOfPages,
    this.height,
    this.width,
    this.length,
    this.weight,
    this.price,
    this.quantity,
    this.sellerBookID,
    this.briefAnnotation,
    this.longAnnotation,
    this.coverType,
    this.sellerName,
  );

  factory Book.fromJson(dynamic json) {
    return Book(
      json['_id'] as String,
      json['seller_id'] as String,
      json['bookName'] as String,
      json['authors'] as String,
      json['illustrators'] as String,
      json['interpreters'] as String,
      json['publisher'] as String,
      json['originalLanguage'] as String,
      json['year'] as int,
      json['ISBN'] as int,
      json['EAN'] as int,
      json['ISSN'] as int,
      json['numberOfPages'] as int,
      json['height'] as int,
      json['width'] as int,
      json['length'] as int,
      json['weight'] as int,
      json['price'] as int,
      json['quantity'] as int,
      json['sellerBookId'] as int,
      json['briefAnnotation'] as String,
      json['longAnnotation'] as String,
      json['coverType'] as String,
      json['sellerName'] as String,
    );
  }

  @override
  String toString() {
    return '{ ${this.book_id}, ${this.seller_id}, ${this.bookName}, ${this.authors},'
              '${this.illustrators}, ${this.interpreters}, ${this.publisher}, ${this.originalLanguage},'
              '${this.year}, ${this.ISBN}, ${this.EAN}, ${this.ISSN},'
              '${this.numberOfPages}, ${this.height}, ${this.width}, ${this.length},'
              '${this.weight}, ${this.price}, ${this.quantity}, ${this.sellerBookID},'
              '${this.briefAnnotation}, ${this.longAnnotation}, ${this.coverType}, ${this.sellerName}, }';
  }
}

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
  List<Book> book;

  _getBook() async {
    prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('http://192.168.0.112:5000/get_book');
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'x-access-token': '${prefs.getString('token')}'
    };
    print('${prefs.getString('token')}');
    String json = '{"book_id" : "${widget.bookID}" }';
    // make Post request
    print(json);
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    print(statusCode);
    // this API passes back the id of the new item added to the body
    String body = response.body;
    print(body);
    print(jsonDecode(body));
    if (statusCode == 200) {
      var booksObjs = jsonDecode(body)['book'] as List;
      setState(() {
        book = booksObjs.map((bookJson) => Book.fromJson(bookJson)).toList();
      });
    }
    // print(jsonDecode(body)['books']);
    print(book);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
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
                Text('ISBN :- ${book[0].ISBN}' ),
                Text('EAN :- ${book[0].EAN}' ),
                Text('ISSN :- ${book[0].ISSN}' ),
                Text('numberOfPages :- ${book[0].numberOfPages}' ),
                Text('height :- ${book[0].height}' ),
                Text('width :- ${book[0].width}' ),
                Text('length :- ${book[0].length}' ),
                Text('weight :- ${book[0].weight}' ),
                Text('price :- ${book[0].price}' ),
                Text('quantity :- ${book[0].quantity}' ),
                Text('sellerBookID :- ${book[0].sellerBookID}' ),
                Text('briefAnnotation :- ${book[0].briefAnnotation}' ),
                Text('longAnnotation :- ${book[0].longAnnotation}' ),
                Text('cover_type :- ${book[0].coverType}' ),
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
    );
  }
}
