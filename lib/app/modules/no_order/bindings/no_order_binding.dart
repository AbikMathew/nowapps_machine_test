import 'package:get/get.dart';

import '../controllers/no_order_controller.dart';

class NoOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoOrderController>(
      () => NoOrderController(),
    );
  }
}
