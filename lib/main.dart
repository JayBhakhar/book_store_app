import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:book_store_app/get_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(GetMaterialApp(
    title: 'Book Store',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    getPages: getPagesList,
    initialRoute: '/',
  ));
}
