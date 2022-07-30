import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NoOrderController extends GetxController {
  final reasonController = TextEditingController().obs;
  final getStorage = GetStorage();

  submit() {
    getStorage.write('checkoutPermission', 'granted');
    Get.defaultDialog(
      title: 'Submit Reason',
      content: Text('Submit the reason for not taking orders'),
      actions: [
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () => Get.back(),
        ),
        ElevatedButton(
          child: Text('Submit'),
          onPressed: () {
            // controller.checkinToRetailer(a[index]);
            Get.back();
            Get.back();
          },
        ),
      ],
    );
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
