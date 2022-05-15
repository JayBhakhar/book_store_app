import 'package:book_store_app/models/Order.dart';
import 'package:book_store_app/services/api_services.dart';
import 'package:get/get.dart';

class OrderController extends GetxController with StateMixin<RxList<Order>> {
  bool isClientsOrder = Get.arguments;
  RxList<Order> orderList;
  var selectedOrderStatus = "".obs;

  onChangeOrderStatus(var orderStatus) {
    selectedOrderStatus.value = orderStatus;
  }

  @override
  void onInit() async {
    super.onInit();
    try {
      change(null, status: RxStatus.loading());
      orderList = await ApiServices().getOrderRequst(isClientsOrder);
      if (orderList == []) {
        change([].obs, status: RxStatus.empty());
      } else {
        change(orderList, status: RxStatus.success());
      }
    } catch (err) {
      change(null, status: RxStatus.error('$err'));
    }
  }
}
