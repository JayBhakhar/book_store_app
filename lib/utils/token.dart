import 'package:shared_preferences/shared_preferences.dart';

class Token {
  SharedPreferences prefs;

  getCurrentUser() async {
    prefs = await SharedPreferences.getInstance();
    print('${prefs.getString('token')}');
  }
}
