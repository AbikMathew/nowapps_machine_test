import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  var getStorage = GetStorage();

  void checkinToRetailer(String retailerName) {
    getStorage.write('checked_in', true);
    getStorage.write('retailer_name', retailerName);
    Get.offAllNamed(Routes.CHECKED_IN, arguments: retailerName);
  }

  @override
  void onClose() {}
}
