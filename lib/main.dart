import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:book_store_app/get_pages.dart';

void main() async {
  await GetStorage.init();
  box.write('addCardList', []);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Book Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: getPagesList,
      initialRoute: '/',
    );
  }
}
