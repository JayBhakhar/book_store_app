import 'package:book_store_app/models/Book.dart';
import 'package:book_store_app/services/api_services.dart';
import 'package:book_store_app/services/book_provider.dart';
import 'package:get/get.dart';

class BookDetailsController extends GetxController with StateMixin<List<Book>> {
  Map deliveryMap = {};

  @override
  void onInit() {
    super.onInit();
    var bookId = Get.arguments;

    BookProvider().getBook(bookId).then((resp) async {
      deliveryMap = await ApiServices().getDeliveryCharges(resp[0].weight);
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
