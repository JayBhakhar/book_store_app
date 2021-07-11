import 'package:book_store_app/views/pages/Book_Details/book_details.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          InkWell(
            child: Container(
              width: 170,
              height: 190,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Image.network(src)
                    Image(
                      image: AssetImage('assets/images/image.jpg'),
                    ),
                    Text('book name'),
                    Text('author name'),
                    Text('price'),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetails(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
