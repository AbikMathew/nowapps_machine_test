import 'package:get/get.dart';

import '../controllers/take_order_controller.dart';

class TakeOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TakeOrderController>(
      () => TakeOrderController(),
    );
  }
}
