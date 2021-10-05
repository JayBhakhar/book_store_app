import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/services/book_provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;

class HomeController extends GetxController with StateMixin<List<Book>> {
  @override
  void onInit() {
    super.onInit();
    BookProvider().getBook().then((resp) {
      change(
        resp,
        status: RxStatus.success(),
      );
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(
          err.toString(),
        ),
      );
    });
  }
}
