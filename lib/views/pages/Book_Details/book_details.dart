import 'dart:convert';
import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/utils/ProgressIndicatorLoader.dart';
import 'package:book_store_app/views/pages/Cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

class BookDetails extends StatefulWidget {
  List<Book> book;
  BookDetails({this.book});

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  SharedPreferences prefs;
  bool isLoading = false;

  _add_item_to_cart() async {
    // set up POST request arguments
    final url = Uri.parse('$apiBaseURL/cart');
    prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      "Content-type": "application/json",
      'x-access-token': '${prefs.getString('token')}'
    };
    String json = '{'
        '"book_id": "${widget.book[0].book_id}",'
        '"seller_id": "${widget.book[0].seller_id}",'
        '"seller_book_id": "${widget.book[0].sellerBookID}"'
        '}';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;
    if (statusCode == 200) {
      Map<String, dynamic> responseMessage = jsonDecode(body);
      // var message = responseMessage['message'];
      // backend message needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: Icon(Icons.shopping_cart),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart(),
                ),
              );
            },
          ),
        ],
      ),
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
                    Text('Book name :- ${widget.book[0].bookName}'),
                    Text('Author :- ${widget.book[0].authors}'),
                    Text('illustrators :- ${widget.book[0].illustrators}'),
                    Text('interpreters :- ${widget.book[0].interpreters}'),
                    Text('publisher :- ${widget.book[0].publisher}'),
                    Text(
                        'originalLanguage :- ${widget.book[0].originalLanguage}'),
                    Text('year :- ${widget.book[0].year} '),
                    Text('ISBN :- ${widget.book[0].ISBN}'),
                    Text('EAN :- ${widget.book[0].EAN}'),
                    Text('ISSN :- ${widget.book[0].ISSN}'),
                    Text('numberOfPages :- ${widget.book[0].numberOfPages}'),
                    Text('height :- ${widget.book[0].height}'),
                    Text('width :- ${widget.book[0].width}'),
                    Text('length :- ${widget.book[0].length}'),
                    Text('weight :- ${widget.book[0].weight}'),
                    Text('price :- ${widget.book[0].price}'),
                    Text('quantity :- ${widget.book[0].quantity}'),
                    Text('sellerBookID :- ${widget.book[0].sellerBookID}'),
                    Text(
                        'briefAnnotation :- ${widget.book[0].briefAnnotation}'),
                    Text('longAnnotation :- ${widget.book[0].longAnnotation}'),
                    Text('cover_type :- ${widget.book[0].coverType}'),
                    Text('seller_id :- ${widget.book[0].seller_id}'),
                    Text('book_id :- ${widget.book[0].book_id}'),
                    Text('seller_book_id :- ${widget.book[0].sellerBookID}'),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                      ),
                      child: Container(
                        child: Text('add to cart'),
                      ),
                      onPressed: () {
                        _add_item_to_cart();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Book added'),
                          ),
                        );
                        // ${widget.book[0].book_id} <-- book id
                        // ${widget.book[0].seller_id} <-- seller id
                        // ${widget.book[0].sellerBookID} <-- seller book id
                        // item add to cart
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          ProgressIndicatorLoader(
            color: Colors.black,
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}
