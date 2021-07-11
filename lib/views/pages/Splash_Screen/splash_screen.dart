import 'package:book_store_app/test.dart';
import 'package:book_store_app/views/pages/Add_Book/add_book.dart';
import 'package:book_store_app/views/pages/Home_Screen/home.dart';
import 'package:book_store_app/views/pages/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _makePath();
  }

  void _makePath() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(), // login screen
          ),
        );
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AddBook(), //home screen
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Text('splash screen'),
    );
  }
}
