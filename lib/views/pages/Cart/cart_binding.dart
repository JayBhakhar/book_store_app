import 'package:book_store_app/views/pages/Cart/cart_controller.dart';
import 'package:get/get.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}