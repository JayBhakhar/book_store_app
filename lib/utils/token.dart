import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;
// String token = prefs.getString('token');

class Token {

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

}
