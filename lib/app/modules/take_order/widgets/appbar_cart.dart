import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/modules/take_order/controllers/take_order_controller.dart';
import 'package:nowapps_machine_test/app/routes/app_pages.dart';

class CartIcon extends StatelessWidget {
  final controller = Get.find<TakeOrderController>();
  CartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.CART),
            icon: const Icon(Icons.shopping_cart),
            iconSize: 35,
          ),
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 9,
            child: Obx(
              () => Text(
                controller.product.length.toString(),
                style: TextStyle(fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
