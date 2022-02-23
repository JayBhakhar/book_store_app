import 'package:book_store_app/views/pages/Book_Details/book_details_controller.dart';
import 'package:get/get.dart';

class BookDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookDetailsController());
  }
}