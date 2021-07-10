import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class BookDetails extends StatefulWidget {
  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
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
                Text('book name'),
                Text("authors': 'jay bhakhar'"),
                Text("illustrators': 'person name',"),
                Text("interpreters': 'person name',"),
                Text("'publisher': 'anton',"),
                Text("'originalLanguage': 'Russian',"),
                Text("'year': 1999,"),
                Text("'ISBN': 846454532,"),
                Text("'EAN': 12321231321,"),
                Text("'ISSN': 132123132,"),
                Text("'numberOfPages': 100,"),
                Text("'height': 23,"),
                Text("'width': 452,"),
                Text("'length': 54,"),
                Text("'weight': 75,"),
                Text("'price': 75,"),
                Text("'quantity': 48,"),
                Text("'sellerBookID': 1,"),
                Text("'briefAnnotation': '50-100 words',"),
                Text("'longAnnotation': '500-600 words',"),
                Text("'cover_type': 'Hard/Soft'"),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                  ),
                  child: Container(
                    child: Text('add to cart'),
                  ),
                  onPressed: () {
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
