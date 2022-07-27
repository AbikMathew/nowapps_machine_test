import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class OtpLoginController extends GetxController {
  var getStorage = GetStorage();
  var phoneNumberController = TextEditingController().obs;

  String? get errorText {
    final text = phoneNumberController.value.text;
    // at any time, we can get the text from _controller.value.text
    log(text);
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }

  void verifyOtp(String otp) {
    getStorage.write('logged_in', true);
    Get.offAllNamed(Routes.HOME);
  }

  @override
  void onClose() {}
}
