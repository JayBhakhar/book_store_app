import 'dart:convert';
import 'package:book_store_app/views/pages/Splash_Screen/splash_screen.dart';
import 'package:book_store_app/views/widgets/Custom_TextFormField_forInt.dart';
import 'package:book_store_app/views/widgets/Custom_TextFormField_forInt_Withlen.dart';
import 'package:book_store_app/views/widgets/Custom_TextFormField_forStr.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddBook extends StatefulWidget {
  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final TextEditingController bookName = TextEditingController();
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

  SharedPreferences prefs;

  _addBookRequest() async {
    prefs = await SharedPreferences.getInstance();
    // set up POST request arguments
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
        title: Text('Add a new Book'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormFieldForStr(
                  controller: bookName,
                  labelText: 'Book Name',
                ),
                CustomTextFormFieldForStr(
                  controller: authors,
                  labelText: 'Authors',
                ),
                CustomTextFormFieldForStr(
                  controller: illustrators,
                  labelText: 'Illustrators',
                ),
                CustomTextFormFieldForStr(
                  controller: interpreters,
                  labelText: 'Interpreters',
                ),
                CustomTextFormFieldForStr(
                  controller: publisher,
                  labelText: 'Publisher',
                ),
                CustomTextFormFieldForStr(
                  controller: originalLanguage,
                  labelText: 'Original Language',
                ),
                CustomTextFormFieldForIntWithlen(
                  controller: year,
                  labelText: 'Year',
                  length: 4,
                ),
                CustomTextFormFieldForInt(
                  controller: ISBN,
                  labelText: 'ISBN',
                ),
                CustomTextFormFieldForInt(
                  controller: EAN,
                  labelText: 'EAN',
                ),
                CustomTextFormFieldForInt(
                  controller: ISSN,
                  labelText: 'ISSN',
                ),
                CustomTextFormFieldForInt(
                  controller: numberOfPages,
                  labelText: 'Number Of Pages',
                ),
                CustomTextFormFieldForInt(
                  controller: height,
                  labelText: 'Height',
                ),
                CustomTextFormFieldForInt(
                  controller: width,
                  labelText: 'Width',
                ),
                CustomTextFormFieldForInt(
                  controller: length,
                  labelText: 'Length',
                ),
                CustomTextFormFieldForInt(
                  controller: weight,
                  labelText: 'Weight',
                ),
                CustomTextFormFieldForInt(
                  controller: price,
                  labelText: 'EAN',
                ),
                CustomTextFormFieldForInt(
                  controller: quantity,
                  labelText: 'Quantity',
                ),
                CustomTextFormFieldForInt(
                  controller: sellerBookID,
                  labelText: 'Your Book ID', // need to conform
                ),
                CustomTextFormFieldForStr(
                  controller: briefAnnotation,
                  labelText: 'Brief Annotation',
                ),
                CustomTextFormFieldForStr(
                  controller: longAnnotation,
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
                        _addBookRequest(); //need to make
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SplashScreen(),
                          ),
                        );
                      }
                    },
                    child: Text("Add Book"),
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
