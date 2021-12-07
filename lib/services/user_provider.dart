import 'package:get/get.dart';
import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/User.dart';
import 'package:get_storage/get_storage.dart';

class UserProvider extends GetConnect {
  Future<List<User>> getUser() async {
    final box = GetStorage();
    final token = box.read('token');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Authorization': 'Bearer $token'
    };
    final response = await get('$apiBaseURL/registration', headers: headers);
    // if (response.status.hasError) {
    if (false) {
      return Future.error(response.statusText);
    } else {
      // List<User> _user = User.listFromJson(response.body['User']);
      List<User> _user = User.listFromJson([
        {
          "_id": "8662c7f3-878d-41bd-ad8f-bd50e9801bce",
          "user_name": "jay bhakhar",
          "email": "jay@jay1.com",
          // "password": "$2b$12$e9QJgmzBI3YtRhiWJ0uVmONNMnywiSrJZW7vAD1tvN/n9mwJ5/wMW",
          "password": "",
          "address": "jay1",
          "phone_number": ""
        }
      ]);
      return _user;
    }
  }
}
