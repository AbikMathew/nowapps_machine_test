import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/no_order_controller.dart';

class NoOrderView extends GetView<NoOrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('No Order'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Please enter the reason for not taking any orders:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            child: Obx(
              () {
                // log(controller.reasonController.value.text);
                return TextField(
                  onChanged: ((value) {
                    // controller.reasonController.value.text = value;
                    log(controller.reasonController.value.text);
                  }),
                  maxLines: 5,
                  controller: controller.reasonController.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: controller.reasonController.value.text.isEmpty
                        ? null
                        : 'Reason',
                    hintText: 'Reason',
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            child: Text('Submit'),
            onPressed: () {
              controller.submit();
            },
          )
        ],
      ),
    );
  }
}

