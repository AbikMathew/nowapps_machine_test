import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/modules/otp_login/bindings/otp_login_binding.dart';
import 'package:nowapps_machine_test/app/modules/otp_login/views/otp_login_view.dart';
import 'package:nowapps_machine_test/app/routes/app_pages.dart';

import '../controllers/otp_login_controller.dart';

class EnterPhoneNoView extends GetView<OtpLoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your phone number',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(() => TextField(
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (value) {
                  //   if (value!.length < 4) {
                  //     log('message');
                  //   }
                  //   return null;
                  // },
                  controller: controller.phoneNumberController.value,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone number',
                    // errorText: controller.errorText,
                  ),
                )),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                Get.offAll(
                  OtpLoginView(),
                  binding: OtpLoginBinding(),
                );
                // controller.login();
              },
            )
          ],
        ),
      ),
    );
  }
}
