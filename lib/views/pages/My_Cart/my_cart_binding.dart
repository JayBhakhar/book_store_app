import 'package:book_store_app/views/pages/My_Cart/my_cart_controller.dart';
import 'package:get/get.dart';

class MyCartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCartController());
  }
}