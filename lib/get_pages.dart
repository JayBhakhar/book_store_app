import 'package:book_store_app/Unit_Test/test_binding.dart';
import 'package:book_store_app/Unit_Test/test_view.dart';
import 'package:book_store_app/views/pages/Book_Details/book_details_binding.dart';
import 'package:book_store_app/views/pages/Book_Details/book_details_view.dart';
import 'package:book_store_app/views/pages/Change_Password/change_password_binding.dart';
import 'package:book_store_app/views/pages/Change_Password/change_password_view.dart';
import 'package:book_store_app/views/pages/Choose_Supplier/choose_supplier_binding.dart';
import 'package:book_store_app/views/pages/Choose_Supplier/choose_supplier_view.dart';
import 'package:book_store_app/views/pages/Forget_Password/forget_password.dart';
import 'package:book_store_app/views/pages/Home_Screen/home_binding.dart';
import 'package:book_store_app/views/pages/Home_Screen/home_view.dart';
import 'package:book_store_app/views/pages/Login/login_binding.dart';
import 'package:book_store_app/views/pages/Login/login_view.dart';
import 'package:book_store_app/views/pages/Cart/cart_binding.dart';
import 'package:book_store_app/views/pages/Cart/cart_view.dart';
import 'package:book_store_app/views/pages/Order/order_binding.dart';
import 'package:book_store_app/views/pages/Order/order_view.dart';
import 'package:book_store_app/views/pages/Profile/profile_binding.dart';
import 'package:book_store_app/views/pages/Profile/profile_view.dart';
import 'package:book_store_app/views/pages/Registration/registration_binding.dart';
import 'package:book_store_app/views/pages/Registration/registration_view.dart';
import 'package:book_store_app/views/pages/Splash_Screen/splash_binding.dart';
import 'package:book_store_app/views/pages/Splash_Screen/splash_view.dart';
import 'package:book_store_app/views/pages/payment/payment_binding.dart';
import 'package:book_store_app/views/pages/payment/payment_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';

List<GetPage> getPagesList = [
  GetPage(
    name: "/",
    page: () {
      GetStorage box = GetStorage();
      return box.hasData('token') ? SplashView() : LoginView();
    },
    bindings: [SplashBinding(), LoginBinding()],
  ),
  GetPage(name: "/home", page: () => HomeView(), binding: HomeBinding()),
  GetPage(name: "/forgetPassword", page: () => ForgetPassword()),
  GetPage(name: "/home", page: () => HomeView(), binding: HomeBinding()),
  GetPage(
      name: "/bookdetails",
      page: () => BookdetailsView(),
      binding: BookDetailsBinding()),
  GetPage(name: "/login", page: () => LoginView(), binding: LoginBinding()),
  GetPage(name: "/cart", page: () => MyCartView(), binding: CartBinding()),
  GetPage(
      name: "/registration",
      page: () => RegistrationView(),
      binding: RegistrationBinding()),
  GetPage(
      name: "/profile", page: () => ProfileView(), binding: ProfileBinding()),
  GetPage(
      name: "/splashscreen",
      page: () => SplashView(),
      binding: SplashBinding()),
  GetPage(
      name: "/changepassword",
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding()),
  GetPage(
      name: "/chooseSupplier",
      page: () => ChooseSupplierView(),
      binding: ChooseSupplierBinding()),
  GetPage(name: "/test", page: () => TestView(), binding: TestBinding()),
  GetPage(
      name: "/payment", page: () => PaymentView(), binding: PaymentBinding()),
  GetPage(name: "/order", page: () => OrderView(), binding: OrderBinding()),
];
