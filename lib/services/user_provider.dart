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
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      List<User> _user = User.listFromJson(response.body['User']);
        return _user;
    }
  }
}
