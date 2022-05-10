import 'package:book_store_app/models/Cart.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class CartController extends GetxController {
  var data;
  RxList<Cart> addCartList;

  @override
  void onInit() {
    super.onInit();
    data = box.read('addCardList');
    addCartList = Cart.listFromJson(data).obs;
  }
}
