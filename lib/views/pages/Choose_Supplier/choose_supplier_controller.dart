import 'package:book_store_app/models/ChooseSupplier.dart';
import 'package:book_store_app/services/api_services.dart';
import 'package:get/get.dart';

class ChooseSupplierController extends GetxController
    with StateMixin<List<ChooseSupplier>> {
  @override
  void onInit() async {
    super.onInit();
    // todo: not tested
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

// {'_id': 'c34fbcdd-da03-4ed0-928e-ce71726660b6', 'Цена_поставщика': 623.0, 'id_книги_наш': 31504, 'id_книги_поставщика': 13214, 'поставщик': 'Бакен', 'срок_отправки_поставщика': 5, 'delivery_charge': 129, 'delivery_name': '5post'}
