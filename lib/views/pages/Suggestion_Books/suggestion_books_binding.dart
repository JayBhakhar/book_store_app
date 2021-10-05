import 'package:book_store_app/views/pages/Suggestion_Books/suggestion_books_controller.dart';
import 'package:get/get.dart';

class SuggestionBooksBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuggestionBooksController());
  }
}