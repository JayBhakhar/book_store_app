import 'package:book_store_app/views/pages/Order/order_controller.dart';
import 'package:get/get.dart';

class OrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderController());
  }
}