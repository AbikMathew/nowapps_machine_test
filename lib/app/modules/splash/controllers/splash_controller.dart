import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nowapps_machine_test/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final getStorage = GetStorage();

  @override
  void onReady() {
    super.onReady();

    final checkedIn = getStorage.read('checked_in');
    final loggedIn = getStorage.read('logged_in');

    //if checkedIn => Go to checkedIn page
    if (checkedIn == true) {
      Future.delayed(
        const Duration(milliseconds: 1500),
        () => Get.offAllNamed(
          Routes.CHECKED_IN,
          arguments: getStorage.read('retailer_name'),
        ),
      );
    }
    //if only loggedIn => Go to home page (Retailers list for checkIn)
    else if (loggedIn == true) {
      Future.delayed(
        const Duration(milliseconds: 1500),
        () => Get.offAllNamed(Routes.HOME),
      );
    } else {
      Future.delayed(
        const Duration(milliseconds: 1500),
        () => Get.offAllNamed(Routes.OTP_LOGIN),
      );
    }
  }

  @override
  void onClose() {}
}
