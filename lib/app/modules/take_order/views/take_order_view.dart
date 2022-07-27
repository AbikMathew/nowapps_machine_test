import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/take_order_controller.dart';

class TakeOrderView extends GetView<TakeOrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TakeOrderView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TakeOrderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
