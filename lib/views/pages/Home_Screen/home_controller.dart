import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/services/book_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController with StateMixin<List<Book>> {
  @override
  void onInit() async {
    super.onInit();
    GetStorage box = GetStorage();
    if (box.read('addCardList') == null) box.write('addCardList', []);
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
