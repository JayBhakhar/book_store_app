import 'package:book_store_app/models/User.dart';
import 'package:book_store_app/services/user_provider.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  List<User> user;

  @override
  void onInit() async {
    user = await UserProvider().getUser();
    Get.toNamed('/home');
    super.onInit();
  }
}
