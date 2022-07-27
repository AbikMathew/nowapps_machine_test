import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/routes/app_pages.dart';
import 'package:pinput/pinput.dart';

import '../controllers/otp_login_controller.dart';

class OtpLoginView extends GetView<OtpLoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(),
            Pinput(
              onCompleted: (value) => 
              controller.verifyOtp(value),
              
            ),
          ],
        ),
      ),
    );
  }
}
