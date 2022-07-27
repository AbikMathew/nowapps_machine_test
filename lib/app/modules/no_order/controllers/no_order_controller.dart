import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoOrderController extends GetxController {
  final reasonController = TextEditingController().obs;
  submit() {
    // log(reasonController.value.text);
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
