import 'package:get/get.dart';
import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/User.dart';
import 'package:get_storage/get_storage.dart';

class UserProvider extends GetConnect {
  GetStorage box = GetStorage();
  final url = '$apiBaseURL/user';
  
  Future<List<User>> getUser() async {
    final token = box.read('token');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Authorization': 'Bearer $token'
    };
    final response = await get(url, headers: headers);
    if (response.status.hasError) {
      Get.snackbar('Error', response.statusText,
          snackPosition: SnackPosition.BOTTOM);
      return Future.error(response.statusText);
    } else {
      List<User> _user = User.listFromJson(response.body['User']);
      return _user;
    }
  }

  void createUser(String body) async {
    final response = await post(url, body);
    if (response.status.code == 409) {
      String message = response.body['message'];
      Get.snackbar('Error', message, snackPosition: SnackPosition.BOTTOM);
    } else if (response.status.hasError) {
      Get.snackbar('Error', response.statusText,
          snackPosition: SnackPosition.BOTTOM);
      return Future.error(response.statusText);
    } else {
      String message = response.body['message'];
      Get.snackbar('Success', message, snackPosition: SnackPosition.BOTTOM);
      Get.toNamed('/');
    }
  }

  void updateUser(String body) async {
    final token = box.read('token');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Authorization': 'Bearer $token'
    };
    final response = await put(url, body, headers: headers);
    if (response.status.hasError) {
      Get.snackbar('Error', response.statusText,
          snackPosition: SnackPosition.BOTTOM);
      return Future.error(response.statusText);
    } else {
      String message = response.body['message'];
      Get.snackbar('success', message, snackPosition: SnackPosition.BOTTOM);
      Get.offNamed('/');
    }
  }
}
