import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/services/book_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:book_store_app/views/pages/Book_Details/book_details.dart';
import 'package:flutter/material.dart';


class BookCard extends StatefulWidget {
  final int index;
  BookCard({this.index});

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  List<Book> books = [];
  SharedPreferences prefs;

  void initState() {
    super.initState();
    BookAPI().getBooks().then((List<Book> _books){
      books = _books;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          InkWell(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Image.network(src)
                    Image(
                      image: AssetImage('assets/images/image.jpg'),
                    ),
                    Text('${books[widget.index].bookName}'),
                    Text('${books[widget.index].authors}'),
                    Text('Price :- \$ ${books[widget.index].price}'),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetails(
                    bookID: books[widget.index].book_id,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
