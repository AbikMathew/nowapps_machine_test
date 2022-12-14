import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
          children: [
            Text(
              'Enter your phone number',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => TextField(
                onChanged: (value) {},
                controller: controller.phoneNumberController.value,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone number',
                ),
              ),
            ),
            loginButton()
          ],
        ),
      ),
    );
  }

  ElevatedButton loginButton() {
    return ElevatedButton(
      child: Text('Login'),
      onPressed: () {
        controller.login();
      },
    );
  }
}
