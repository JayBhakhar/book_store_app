import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final box = GetStorage();
  @override
  void onInit() {
    _makepath();
    super.onInit();
  }

  void _makepath() {
    print(box.read('token'));
    if (box.read('token') == null) {
      Get.toNamed('/login');
    } else {
      Get.toNamed('/home');
    }
  }
}
