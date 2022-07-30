import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/routes/app_pages.dart';
// import 'package:nowapps_machine_test/app/modules/checked_in/widgets/menu_item.dart';

import '../controllers/checked_in_controller.dart';
import '../widgets/menu_item.dart';

class CheckedInView extends GetView<CheckedInController> {
  final retailerName = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to $retailerName'),
        centerTitle: true,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomMenuItem(
            text: 'Take Order',
            icon: Icons.shopping_cart,
            onTap: () => Get.toNamed(Routes.TAKE_ORDER),
          ),
          CustomMenuItem(
            text: 'No Order',
            icon: Icons.remove_shopping_cart,
            onTap: () => Get.toNamed(Routes.NO_ORDER),
          ),
          CustomMenuItem(
            text: 'Checkout',
            icon: Icons.logout,
            onTap: () => controller.checkout(),
          ),
        ],
      ),
    );
  }
}
