import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nowapps_machine_test/app/modules/otp_login/views/otp_login_view.dart';

import '../../../routes/app_pages.dart';

class OtpLoginController extends GetxController {
  var getStorage = GetStorage();
  var phoneNumberController = TextEditingController().obs;

  void login() {
    log(GetUtils.isPhoneNumber(phoneNumberController.value.text).toString());
    GetUtils.isPhoneNumber(phoneNumberController.value.text)
        ? Get.offAll(OtpLoginView())
        : Get.snackbar('Error', 'Please enter a valid phone number',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
  }

  void verifyOtp(String otp) {
    getStorage.write('logged_in', true);
    Get.offAllNamed(Routes.HOME);
  }

  @override
  void onClose() {}
}
