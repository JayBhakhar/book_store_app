import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/services/book_provider.dart';
import 'package:get/get.dart';

class BookDetailsController extends GetxController with StateMixin<List<Book>> {
  @override
  void onInit() async {
    super.onInit();
    try {
      change(null, status: RxStatus.loading());
      var bookId = Get.arguments;
      final _book = await BookProvider().getBook(bookId);
      if (_book == []) {
        change([], status: RxStatus.empty());
      } else {
        // deliveryMap = await ApiServices().getDeliveryCharges(resp[0].weight); 
        change(_book, status: RxStatus.success());
      }
    } catch (err) {
      change(null, status: RxStatus.error('$err'));
    }
  }
}
