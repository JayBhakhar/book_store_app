import 'package:book_store_app/models/User.dart';
import 'package:book_store_app/services/user_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  List<User> user;

  @override
  void onInit() async {
    super.onInit();
    GetStorage box = GetStorage();
    if (box.hasData('token')) {
      try {
        user = await UserProvider().getUser();
        Get.toNamed('/home');
      } catch (err) {
        Get.snackbar('Error', err, snackPosition: SnackPosition.BOTTOM);
      }
    }
  }
}
