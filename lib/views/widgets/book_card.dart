import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/views/pages/Book_Details/book_details.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final List<Book> books_list;
  final int index;

  BookCard({this.books_list, this.index});

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
                    Text('${books_list[index].bookName}'),
                    Text('${books_list[index].authors}'),
                    Text('Price :- \$ ${books_list[index].price}'),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetails(
                    bookID: '${books_list[index].book_id}',
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
