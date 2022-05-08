import 'package:book_store_app/views/pages/payment/payment_controller.dart';
import 'package:get/get.dart';

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentController());
  }
}