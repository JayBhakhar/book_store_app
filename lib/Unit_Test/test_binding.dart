import 'package:book_store_app/Unit_Test/test_controller.dart';
import 'package:get/get.dart';

class TestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestController());
  }
}