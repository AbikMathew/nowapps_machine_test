import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class CheckedInController extends GetxController {
  var getStorage = GetStorage();
  final count = 0.obs;

  void checkout() {
    final checkoutPermission = getStorage.read('checkoutPermission');

    if (checkoutPermission == 'granted') {
      getStorage.write('checked_in', false);
      getStorage.write('checkoutPermission', 'denied');

      Get.offAllNamed(Routes.HOME);
    } else {
      Get.defaultDialog(
        title: 'Cannot checkout',
        content:
            Text('Either take an order or enter no-order-reason for checkout'),
        actions: [
          ElevatedButton(
            child: Text('No Order'),
            onPressed: () {
              Get.back();
              Get.toNamed(Routes.NO_ORDER);
            },
          ),
          ElevatedButton(
            child: Text('Take Order'),
            onPressed: () {
              Get.back();
              Get.toNamed(Routes.TAKE_ORDER);
            },
          ),
        ],
      );
    }
  }
}
