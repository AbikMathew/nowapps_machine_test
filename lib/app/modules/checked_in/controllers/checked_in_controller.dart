import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class CheckedInController extends GetxController {
  var getStorage = GetStorage();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void checkout() {
    getStorage.write('checked_in', false);
    Get.offAllNamed(Routes.HOME);
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
