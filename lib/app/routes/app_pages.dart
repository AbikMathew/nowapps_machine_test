import 'package:get/get.dart';

import 'package:nowapps_machine_test/app/modules/cart/bindings/cart_binding.dart';
import 'package:nowapps_machine_test/app/modules/cart/views/cart_view.dart';
import 'package:nowapps_machine_test/app/modules/checked_in/bindings/checked_in_binding.dart';
import 'package:nowapps_machine_test/app/modules/checked_in/views/checked_in_view.dart';
import 'package:nowapps_machine_test/app/modules/home/bindings/home_binding.dart';
import 'package:nowapps_machine_test/app/modules/home/views/home_view.dart';
import 'package:nowapps_machine_test/app/modules/no_order/bindings/no_order_binding.dart';
import 'package:nowapps_machine_test/app/modules/no_order/views/no_order_view.dart';
import 'package:nowapps_machine_test/app/modules/otp_login/bindings/otp_login_binding.dart';
import 'package:nowapps_machine_test/app/modules/otp_login/views/otp_login_view.dart';
import 'package:nowapps_machine_test/app/modules/splash/bindings/splash_binding.dart';
import 'package:nowapps_machine_test/app/modules/splash/views/splash_view.dart';
import 'package:nowapps_machine_test/app/modules/take_order/bindings/take_order_binding.dart';
import 'package:nowapps_machine_test/app/modules/take_order/views/take_order_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.OTP_LOGIN,
      page: () => OtpLoginView(),
      binding: OtpLoginBinding(),
    ),
    GetPage(
      name: _Paths.CHECKED_IN,
      page: () => CheckedInView(),
      binding: CheckedInBinding(),
    ),
    GetPage(
      name: _Paths.NO_ORDER,
      page: () => NoOrderView(),
      binding: NoOrderBinding(),
    ),
    GetPage(
      name: _Paths.TAKE_ORDER,
      page: () => TakeOrderView(),
      binding: TakeOrderBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
