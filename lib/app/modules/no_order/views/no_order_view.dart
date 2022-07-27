import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/no_order_controller.dart';

class NoOrderView extends GetView<NoOrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NoOrderView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NoOrderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
