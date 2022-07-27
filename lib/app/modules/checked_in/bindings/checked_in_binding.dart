import 'package:get/get.dart';

import '../controllers/checked_in_controller.dart';

class CheckedInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckedInController>(
      () => CheckedInController(),
    );
  }
}
