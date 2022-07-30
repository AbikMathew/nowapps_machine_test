
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
            Get.back();
            Get.back();
          },
        ),
      ],
    );
  }
}
