import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/checked_in_controller.dart';

class CheckedInView extends GetView<CheckedInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckedInView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CheckedInView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
