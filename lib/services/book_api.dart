import 'dart:convert';
import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/Book.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;

class BookAPI {
  Future<List<Book>> getBooks() async {
    prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('$apiBaseURL/books');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'x-access-token': '${prefs.getString('token')}'
    };
    // make Get request
    Response response = await get(url, headers: headers);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;
    if (statusCode == 200) {
      var booksObjs = jsonDecode(body)['books'] as List;
        return booksObjs.map((bookJson) => Book.fromJson(bookJson)).toList();
    }
  }


  Future<List<Book>> getSellerBooks() async {
    prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('$apiBaseURL/seller/books');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'x-access-token': '${prefs.getString('token')}'
    };
    // make Get request
    Response response = await get(url, headers: headers);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;
    if (statusCode == 200) {
      var booksObjs = jsonDecode(body)['sellerBook'] as List;
      return booksObjs.map((bookJson) => Book.fromJson(bookJson)).toList();
    }
  }

}