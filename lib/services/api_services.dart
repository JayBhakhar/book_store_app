import 'package:book_store_app/consts/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ApiServices extends GetConnect {
  Future<Map> getDeliveryCharges(double weight) async {
    final box = GetStorage();
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

  Future<List> getSupplierOptions({String ourBookId, double bookWeight}) async {
    final box = GetStorage();
    final token = box.read('token');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Authorization': 'Bearer $token',
      "our_book_id": "$ourBookId",
      "book_weight": "$bookWeight",
    };
    final response =
        await get('$apiBaseURL/supplier_options', headers: headers);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      // List _supplier_options = Book.listFromJson(response.body['Book']);
      return response.body;
    }
  }
}
