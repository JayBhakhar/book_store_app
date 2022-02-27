import 'package:book_store_app/models/Book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget bookCard(List<Book> _book, int index) {
  return InkWell(
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Image.network(src)
                  Container(
                    width: 150,
                    height: 120,
                    child:
                        Image.network('https://${_book[index].coverFileUrl}'),
                  ),
                  Text(_book[index].bookName.length > 25
                      ? "${_book[index].bookName}".substring(0, 25) + '...'
                      : "${_book[index].bookName}"),
                  Text('${_book[index].authors}'),
                  Text('₽${_book[index].priceOfSupplier}'),
                ],
              ),
            ),
          )
        ],
      ),
    ),
    onTap: () {
      Get.toNamed('/bookdetails', arguments: _book[index].bookID);
    },
  );
}

// Card(
//     child: Column(
//       children: [
//         Container(
//           width: 100,
//           height: 100,
//           child: Image.network('https://${_book[index].coverFileUrl}'),
//         ),
//         Text('author :- ${_book[index].authors}'),
//       ],
//     ),
//   )

// import 'dart:convert';
// import 'package:book_store_app/consts/constants.dart';
// import 'package:book_store_app/models/Book.dart';
// import 'package:book_store_app/utils/ProgressIndicatorLoader.dart';
// import 'package:book_store_app/views/pages/Book_Details/book_details.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart';

// class BookCard extends StatefulWidget {
//   final List<Book> books;
//   int index;
//   BookCard({this.books, this.index});

//   @override
//   _BookCardState createState() => _BookCardState();
// }

// class _BookCardState extends State<BookCard> {
//   SharedPreferences prefs;
//   List<Book> book;
//   bool isLoading = false;

//   _getBook() async {
//     final url = Uri.parse('$apiBaseURL/book');
//     prefs = await SharedPreferences.getInstance();
//     Map<String, String> headers = {
//       'Content-type': 'application/json',
//       'x-access-token': '${prefs.getString('token')}',
//       'book_id': widget.books[widget.index].bookID
//     };
//     // make Post request
//     Response response = await get(url, headers: headers);
//     // check the status code for the result
//     int statusCode = response.statusCode;
//     // this API passes back the id of the new item added to the body
//     String body = response.body;
//     if (statusCode == 200) {
//       var booksObjs = jsonDecode(body)['book'] as List;
//       setState(() {
//         book = booksObjs.map((bookJson) => Book.fromJson(bookJson)).toList();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Card(
//           clipBehavior: Clip.antiAlias,
//           child: Column(
//             children: [
//               InkWell(
//                 child: Container(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         // Image.network(src)
//                         Image(
//                           image: AssetImage('assets/images/image.jpg'),
//                         ),
//                         Text('${widget.books[widget.index].bookName}'),
//                         Text('${widget.books[widget.index].authors}'),
//                         Text('Price :- \$ ${widget.books[widget.index].priceOfSupplier}'),
//                       ],
//                     ),
//                   ),
//                 ),
//                 onTap: () async {
//                   setState(() {
//                     isLoading = true;
//                   });
//                   await _getBook();
//                   setState(() {
//                     isLoading = false;
//                   });
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => BookDetails(
//                         book: book,
//                       ),
//                     ),
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//         ProgressIndicatorLoader(
//           color: Colors.black,
//           isLoading: isLoading,
//         ),
//       ],
//     );
//   }
// }
