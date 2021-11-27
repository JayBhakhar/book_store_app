import 'package:book_store_app/views/pages/Registration/registration_controller.dart';
import 'package:get/get.dart';

class RegistrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationController());
  }
}