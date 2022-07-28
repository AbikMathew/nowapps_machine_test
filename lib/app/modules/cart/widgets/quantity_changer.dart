import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/modules/take_order/controllers/take_order_controller.dart';
// import 'package:sizer/sizer.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class QuantityChanger extends StatelessWidget {
  QuantityChanger({
    Key? key,
    required this.index,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final Color color;
  final VoidCallback onPressed;
  final int index;
  var controller = Get.find<TakeOrderController>();

  @override
  Widget build(BuildContext context) {
    // log(controller.product[index + 1][0].toString());
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
          Obx(
            () => Text(
              controller.product[index + 1][0].toString(),
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          IconButton(
            onPressed: (() =>
                controller.addProduct(controller.product[index + 1][1])),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
