import 'package:get/get.dart';
import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/User.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();
final token = box.read('token');
final url = '$apiBaseURL/registration';
Map<String, String> headers = {
  "Content-type": "application/json",
  'Authorization': 'Bearer $token'
};

class UserProvider extends GetConnect {
  Future<List<User>> getUser() async {
    final response = await get(url, headers: headers);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      List<User> _user = User.listFromJson(response.body['User']);
      return _user;
    }
  }

  void createUser(String body) async {
    final response = await post(url, body);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else if (response.status.code == 409) {
      String message = response.body['message'];
      Get.snackbar('success msg', message, snackPosition: SnackPosition.BOTTOM);
    } else {
      String message = response.body['message'];
      Get.snackbar('success msg', message, snackPosition: SnackPosition.BOTTOM);
      Get.toNamed('/');
    }
  }

  void updateUser(String body) async {
    final response = await put(url, body, headers: headers);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      String message = response.body['message'];
      Get.snackbar('success', message, snackPosition: SnackPosition.BOTTOM);
      Get.offNamed('/');
    }
  }
}
