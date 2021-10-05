import 'package:book_store_app/Unit_Test/test_binding.dart';
import 'package:book_store_app/Unit_Test/test_view.dart';
import 'package:book_store_app/views/pages/Add_Book/add_book.dart';
import 'package:book_store_app/views/pages/Book_Details/book_details.dart';
import 'package:book_store_app/views/pages/Cart/cart.dart';
import 'package:book_store_app/views/pages/Confirm_Seller_List/cofirm_seller_list.dart';
import 'package:book_store_app/views/pages/Edit_Book/edit_book.dart';
import 'package:book_store_app/views/pages/Forget_Password/forget_password.dart';
import 'package:book_store_app/views/pages/Home_Screen/home_binding.dart';
import 'package:book_store_app/views/pages/Home_Screen/home_view.dart';
import 'package:book_store_app/views/pages/Login/login_binding.dart';
import 'package:book_store_app/views/pages/Login/login_view.dart';
import 'package:book_store_app/views/pages/Registration/registration.dart';
import 'package:book_store_app/views/pages/Seller_Requests_List/seller_requests.dart';
import 'package:book_store_app/views/pages/Splash_Screen/splash_screen.dart';
import 'package:book_store_app/views/pages/Suggestion_Books/suggestion_books_binding.dart';
import 'package:book_store_app/views/pages/Suggestion_Books/suggestion_books_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Book Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: "/addBook", page: () => AddBook()),
        GetPage(name: "/bookDetails", page: () => BookDetails()),
        GetPage(name: "/cart", page: () => Cart()),
        GetPage(name: "/confirmSellerList", page: () => ConfirmSellerList()),
        // GetPage(name: "/editBook", page: () => EditBook()),
        GetPage(name: "/forgetPassword", page: () => ForgetPassword()),
        // GetPage(name: "/myBooks", page: ()=> MyBooks()),
        GetPage(name: "/home", page: () => HomeView(), binding: HomeBinding()),
        GetPage(name: "/suggestionbooks", page: () => SuggestionBooksView(), binding: SuggestionBooksBinding()),
        GetPage(
            name: "/login", page: () => LoginPage(), binding: LoginBinding()),
        GetPage(name: "/registration", page: () => Registration()),
        GetPage(name: "/sellerRequests", page: () => SellerRequests()),
        GetPage(name: "/splashscreen", page: () => SplashScreen()),
        GetPage(name: "/test", page: () => TestView(), binding: TestBinding()),
      ],
      // initialRoute: "/splashscreen",
      initialRoute: "/home", // for test
    );
  }
}
