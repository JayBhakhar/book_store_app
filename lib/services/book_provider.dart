import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/Book.dart';
import 'package:get/get.dart';

class BookProvider extends GetConnect {
  Future<List<Book>> getBooks() async {
    final response =
        await get('$apiBaseURL/books'); // url for books inital 10 books
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      List<Book> _book = Book.listFromJson(response.body['Books']);
       return _book;
    }
  }

  Future<List<Book>> getsuggestionBook() async {
    final response =
        await get('$apiBaseURL/books'); // url for books inital 10 books
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      List<Book> _book = Book.listFromJson(response.body['Books']);
      return _book;
    }
  }
}
