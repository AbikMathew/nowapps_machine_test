import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/otp_login_controller.dart';

class OtpLoginView extends GetView<OtpLoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OtpLoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OtpLoginView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
