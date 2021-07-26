import 'package:book_store_app/views/widgets/Custom_TextFormField_Forcountry.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';


read_csv(List arguments) {
  final File file = new File("assets/oktmo.csv");

  Stream<List> inputStream = file.openRead();

  inputStream
      .transform(utf8.decoder)       // Decode bytes to UTF-8.
      .transform(new LineSplitter()) // Convert stream to individual lines.
      .listen((String line) {        // Process results.

    List row = line.split(','); // split by comma

    String id = row[0];
    String symbol = row[1];
    String open = row[2];
    String low = row[3];
    String high = row[4];
    String close = row[5];
    String volume = row[6];
    String exchange = row[7];
    String timestamp = row[8];
    String date = row[9];

    print('$id, $symbol, $open');

  },
      onDone: () { print('File is now closed.'); },
      onError: (e) { print(e.toString()); });
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}


class _TestState extends State<Test> {
  List a;
  SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                onPressed: (){
                  read_csv(a);
                },
                child: Text('Unit Test'),
              ),
              CustomTextFormFieldForCountry(),
            ],
          ),
        ),
      ),
    );
  }
}
