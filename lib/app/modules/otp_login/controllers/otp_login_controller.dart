import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class OtpLoginController extends GetxController {
  var getStorage = GetStorage();
  var phoneNumberController = TextEditingController().obs;

  void verifyOtp(String otp) {
    getStorage.write('logged_in', true);
    Get.offAllNamed(Routes.HOME);
  }

  @override
  void onClose() {}
}
