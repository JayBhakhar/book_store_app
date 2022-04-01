import 'package:book_store_app/models/ChooseSupplier.dart';
import 'package:book_store_app/services/api_services.dart';
import 'package:get/get.dart';

class ChooseSupplierController extends GetxController
    with StateMixin<List<ChooseSupplier>> {
  @override
  void onInit() async {
    super.onInit();
    try {
      change(null, status: RxStatus.loading());
      var arg = Get.arguments;
      final List<ChooseSupplier> _chooseSupplier = await ApiServices()
          .getSupplierOptions(
              ourBookId: arg['our_book_id'], bookWeight: arg['book_weight']);
      if (_chooseSupplier == []) {
        change([], status: RxStatus.empty());
      } else {
        change(_chooseSupplier, status: RxStatus.success());
      }
    } catch (err) {
      change(null, status: RxStatus.error('$err'));
    }
  }
}
