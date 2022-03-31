import 'package:book_store_app/views/pages/Choose_Supplier/choose_supplier_controller.dart';
import 'package:get/get.dart';

class ChooseSupplierBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseSupplierController());
  }
}