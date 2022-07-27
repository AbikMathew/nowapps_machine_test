import 'dart:developer';

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
      body: Column(
        children: [
          Text('Please enter the reason for not taking any orders:'),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
              // controller.submit();
            },
          )
        ],
      ),
    );
  }
}

class ClassName extends StatelessWidget {
  ClassName([this.a = 'kujghi']);
final String? a;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
