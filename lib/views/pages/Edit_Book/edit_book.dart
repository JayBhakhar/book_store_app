import 'dart:convert';
import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/views/pages/My_Books/my_books.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';
import 'package:book_store_app/views/widgets/Custom_TextFormField_forInt.dart';
import 'package:book_store_app/views/widgets/Custom_TextFormField_forInt_Withlen.dart';
import 'package:book_store_app/views/widgets/Custom_TextFormField_forStr.dart';

class EditBook extends StatefulWidget {
  String bookID;
  EditBook({this.bookID});

  @override
  _EditBookState createState() => _EditBookState();
}

class _EditBookState extends State<EditBook> {
  void initState() {
    super.initState();
    _getBook();
  }

  String textbookName;
  String textauthors;
  String textillustrators;
  String textinterpreters;
  String textpublisher;
  String textoriginalLanguage;
  int textyear;
  int textISBN;
  int textEAN;
  int textISSN;
  int textnumberOfPages;
  int textheight;
  int textwidth;
  int textlength;
  int textweight;
  int textprice;
  int textquantity;
  int textsellerBookID;
  String textbriefAnnotation;
  String textlongAnnotation;
  String textcoverType;

  _getBook() async {
    prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('$apiBaseURL/book');
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'x-access-token': '${prefs.getString('token')}',
      'book_id' : '${widget.bookID}'
    };
    print('${prefs.getString('token')}');
    // make Post request
    Response response = await get(url, headers: headers);
    // check the status code for the result
    int statusCode = response.statusCode;
    print(statusCode);
    // this API passes back the id of the new item added to the body
    String body = response.body;
    print(body);
    if (statusCode == 200) {
      var booksObjs = jsonDecode(body)['book'] as List;
      setState(() {
        book = booksObjs.map((bookJson) => Book.fromJson(bookJson)).toList();
        cover_type = book[0].coverType;
      });
    }
  }

  SharedPreferences prefs;
  List<Book> book;

  final TextEditingController bookName = TextEditingController();
  final TextEditingController bookName1 = TextEditingController();
  final TextEditingController authors = TextEditingController();
  final TextEditingController illustrators = TextEditingController();
  final TextEditingController interpreters = TextEditingController();
  final TextEditingController publisher = TextEditingController();
  final TextEditingController originalLanguage = TextEditingController();
  final TextEditingController year = TextEditingController();
  final TextEditingController ISBN = TextEditingController();
  final TextEditingController EAN = TextEditingController();
  final TextEditingController ISSN = TextEditingController();
  final TextEditingController numberOfPages = TextEditingController();
  final TextEditingController height = TextEditingController();
  final TextEditingController width = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController length = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController sellerBookID = TextEditingController();
  final TextEditingController briefAnnotation = TextEditingController();
  final TextEditingController longAnnotation = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String cover_type;
  String _dropdownErrorCoverType;


  _updateBook() async {
    prefs = await SharedPreferences.getInstance();
    final url = Uri.parse('http://192.168.0.112:5000/book');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'x-access-token': '${prefs.getString('token')}'
    };
    String json = '{'
        '"bookName": "${bookName.text}",'
        '"authors": "${authors.text}",'
        '"illustrators": "${illustrators.text}",'
        '"interpreters": "${interpreters.text}",'
        '"publisher": "${publisher.text}",'
        '"originalLanguage": "${originalLanguage.text}",'
        '"year": "${year.text}",'
        '"ISBN": "${ISBN.text}",'
        '"EAN": "${EAN.text}",'
        '"ISSN": "${ISSN.text}",'
        '"numberOfPages": "${numberOfPages.text}",'
        '"height": "${height.text}",'
        '"width": "${width.text}",'
        '"length": "${length.text}",'
        '"weight": "${weight.text}",'
        '"price": "${price.text}",'
        '"quantity": "${quantity.text}",'
        '"sellerBookID": "${sellerBookID.text}",'
        '"briefAnnotation": "${briefAnnotation.text}",'
        '"longAnnotation": "${longAnnotation.text}",'
        '"price": "${price.text}",'
        '"coverType": "$cover_type"'
        '}';
    // make POST request
    Response response = await put(url, headers: headers, body: json);
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
        title: Text('Edit book'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                CustomTextFormFieldForStr(
                  controller: bookName..text = '${book[0].bookName}',
                  labelText: 'Book Name',
                ),
                CustomTextFormFieldForStr(
                  controller: authors..text = '${book[0].authors}',
                  labelText: 'Authors',
                ),
                CustomTextFormFieldForStr(
                  controller: illustrators..text = '${book[0].illustrators}',
                  labelText: 'Illustrators',
                ),
                CustomTextFormFieldForStr(
                  controller: interpreters..text = '${book[0].interpreters}',
                  labelText: 'Interpreters',
                ),
                CustomTextFormFieldForStr(
                  controller: publisher..text = '${book[0].publisher}',
                  labelText: 'Publisher',
                ),
                CustomTextFormFieldForStr(
                  controller: originalLanguage..text = '${book[0].originalLanguage}',
                  labelText: 'Original Language',
                ),
                CustomTextFormFieldForIntWithlen(
                  controller: year..text = '${book[0].year}',
                  labelText: 'Year',
                  length: 4,
                ),
                CustomTextFormFieldForInt(
                  controller: ISBN..text = '${book[0].ISBN}',
                  labelText: 'ISBN',
                ),
                CustomTextFormFieldForInt(
                  controller: EAN..text = '${book[0].EAN}',
                  labelText: 'EAN',
                ),
                CustomTextFormFieldForInt(
                  controller: ISSN..text = '${book[0].ISSN}',
                  labelText: 'ISSN',
                ),
                CustomTextFormFieldForInt(
                  controller: numberOfPages..text = '${book[0].numberOfPages}',
                  labelText: 'Number Of Pages',
                ),
                CustomTextFormFieldForInt(
                  controller: height..text = '${book[0].height}',
                  labelText: 'Height',
                ),
                CustomTextFormFieldForInt(
                  controller: width..text = '${book[0].width}',
                  labelText: 'Width',
                ),
                CustomTextFormFieldForInt(
                  controller: length..text = '${book[0].length}',
                  labelText: 'Length',
                ),
                CustomTextFormFieldForInt(
                  controller: weight..text = '${book[0].weight}',
                  labelText: 'Weight',
                ),
                CustomTextFormFieldForInt(
                  controller: price..text = '${book[0].price}',
                  labelText: 'EAN',
                ),
                CustomTextFormFieldForInt(
                  controller: quantity..text = '${book[0].quantity}',
                  labelText: 'Quantity',
                ),
                CustomTextFormFieldForInt(
                  controller: sellerBookID..text = '${book[0].sellerBookID}',
                  labelText: 'Your Book ID', // need to conform
                ),
                CustomTextFormFieldForStr(
                  controller: briefAnnotation..text = '${book[0].briefAnnotation}',
                  labelText: 'Brief Annotation',
                ),
                CustomTextFormFieldForStr(
                  controller: longAnnotation..text = '${book[0].longAnnotation}',
                  labelText: 'Long Annotation',
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 55, //gives the height of the dropdown button
                        width: MediaQuery.of(context)
                            .size
                            .width, //gives the width of the dropdown button
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            color: Color(0xFFF2F2F2)),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: Color(0xFFF2F2F2),
                            // background color for the dropdown items
                            buttonTheme: ButtonTheme.of(context).copyWith(
                              alignedDropdown: true,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              iconSize: 32,
                              iconEnabledColor: Color(0xFF595959),
                              // icon color of the dropdown button
                              items: [
                                'Hard',
                                'Soft',
                                'Other',
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                );
                              }).toList(),
                              hint: Text(
                                'Select your Cover Type',
                                style: TextStyle(
                                    color: Color(0xFF8B8B8B), fontSize: 15),
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  cover_type =
                                      value; // saving the selected value
                                  _dropdownErrorCoverType = null;
                                });
                              },
                              value: cover_type,
                              // displaying the selected value
                            ),
                          ),
                        ),
                      ),
                      _dropdownErrorCoverType == null
                          ? SizedBox.shrink()
                          : Text(
                        _dropdownErrorCoverType ?? "",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      bool _isValid = _formKey.currentState.validate();
                      if (cover_type == null) {
                        setState(() => _dropdownErrorCoverType =
                        "Please select Cover Type");
                        _isValid = false;
                      }
                      if (_isValid) {
                        _updateBook(); //need to make
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyBooks(), // login screen
                          ),
                        );
                      }
                    },
                    child: Text("Update Book"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
