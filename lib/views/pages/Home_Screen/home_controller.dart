import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/services/book_provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;

class HomeController extends GetxController with StateMixin<List<Book>> {
  @override
  void onInit() async {
    super.onInit();
    try {
      change(null, status: RxStatus.loading());
      final _books = await BookProvider().getBooks();
      if (_books == []) {
        change([], status: RxStatus.empty());
      } else {
        change(_books, status: RxStatus.success());
      }
    } catch (err) {
      change(null, status: RxStatus.error('$err'));
    }
  }
}
