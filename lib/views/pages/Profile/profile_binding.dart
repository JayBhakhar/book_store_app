import 'package:book_store_app/views/pages/Profile/profile_controller.dart';
import 'package:book_store_app/views/pages/Registration/registration_controller.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => RegistrationController());
  }
}
