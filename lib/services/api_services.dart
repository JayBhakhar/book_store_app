import 'package:book_store_app/consts/constants.dart';
import 'package:book_store_app/models/ChooseSupplier.dart';
import 'package:book_store_app/models/Order.dart';
import 'package:book_store_app/views/pages/Cart/cart_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ApiServices extends GetConnect {
  final box = GetStorage();
  Future<Map> getDeliveryCharges(double weight) async {
    final token = box.read('token');
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'weight': '$weight'
    };
    final response =
        await get('$apiBaseURL/delivery_charges', headers: headers);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<List<ChooseSupplier>> getSupplierOptions(
      {int ourBookId, double bookWeight}) async {
    final token = box.read('token');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Authorization': 'Bearer $token',
      "our_book_id": "$ourBookId",
      // "our_book_id": "31504",
      "book_weight": "$bookWeight",
    };
    final response =
        await get('$apiBaseURL/supplier_options', headers: headers);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      List<ChooseSupplier> supplierOptions =
          ChooseSupplier.listFromJson(response.body['ChooseSupplier']);
      return supplierOptions;
    }
  }

  void postLoginRequst(String jsonBody) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    final response =
        await post('$apiBaseURL/login', jsonBody, headers: headers);
    if (response.status.code == 200) {
      String token = response.body['token'];
      box.write('token', token);
      Get.toNamed('/home');
    } else if (response.status.code == 401) {
      String message = response.body['message'];
      Get.snackbar('login fail', message, snackPosition: SnackPosition.BOTTOM);
    } else if (!response.hasError) {
      Get.snackbar('Error', response.statusText,
          snackPosition: SnackPosition.BOTTOM);
      return Future.error(response.statusText);
    } else {
      Get.snackbar('error', 'Something gone wrong');
    }
  }

  void postOrderRequst(String jsonBody) async {
    final token = box.read('token');
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final response =
        await post('$apiBaseURL/order', jsonBody, headers: headers);
    print(response.status.code);
    if (response.status.code == 200) {
      String message = response.body['message'];
      Get.snackbar('Order Success', message,
          snackPosition: SnackPosition.BOTTOM);
      box.write('addCardList', []);
      Get.delete<CartController>();
      Get.toNamed('/home');
    } else if (!response.hasError) {
      Get.snackbar('Error', response.statusText,
          snackPosition: SnackPosition.BOTTOM);
      return Future.error(response.statusText);
    } else {
      Get.snackbar('error', 'Something gone wrong');
    }
  }

  Future<List<Order>> getOrderRequst(bool isClientsOrder) async {
    final token = box.read('token');
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
      'is_clients_order': '$isClientsOrder'
    };
    final response = await get('$apiBaseURL/order', headers: headers);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      List<Order> orderList = Order.listFromJson(response.body['Order']);
      return orderList;
    }
  }
}
