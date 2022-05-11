import 'package:book_store_app/models/Order.dart';
import 'package:book_store_app/services/api_services.dart';
import 'package:get/get.dart';

class OrderController extends GetxController with StateMixin<List<Order>> {
  @override
  void onInit() async {
    super.onInit();
    try {
      change(null, status: RxStatus.loading());
      final List<Order> orderList = await ApiServices().getOrderRequst();
      if (orderList == []) {
        change([], status: RxStatus.empty());
      } else {
        change(orderList, status: RxStatus.success());
      }
    } catch (err) {
      change(null, status: RxStatus.error('$err'));
    }
  }
}
