import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nowapps_machine_test/app/modules/otp_login/bindings/otp_login_binding.dart';
import 'package:nowapps_machine_test/app/modules/otp_login/views/otp_login_view.dart';

import '../../../routes/app_pages.dart';

class OtpLoginController extends GetxController {
  var getStorage = GetStorage();
  var phoneNumberController = TextEditingController().obs;

  void login() {
    isPhoneNumber(phoneNumberController.value.text)
        ? Get.offAll(OtpLoginView(), binding: OtpLoginBinding())
        : Get.snackbar('Error', 'Please enter a valid phone number',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
  }

  void verifyOtp(String otp) {
    getStorage.write('logged_in', true);
    Get.offAllNamed(Routes.HOME);
  }

  static bool isPhoneNumber(String s) {
    if (s.length != 10) return false;
    return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  @override
  void onClose() {}
}
