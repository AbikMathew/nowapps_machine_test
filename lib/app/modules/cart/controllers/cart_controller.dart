import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/data/services/database_services.dart';
import 'package:nowapps_machine_test/app/modules/take_order/controllers/take_order_controller.dart';
import 'package:nowapps_machine_test/app/modules/take_order/model/product.dart';

class CartController extends GetxController {
  RxList<Product> cartItems = <Product>[].obs;
  // Rx<Future<List<Product>>>? cartItems;

  @override
  void onInit() async {
    super.onInit();
    cartItems.value = await getCartItems();
    // cartItems[0]. = 2;
    log('ഇതൊക്കെ എന്തു ${cartItems}');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  buyNow() {
    // TakeOrderController.
    Get.dialog(
      AlertDialog(
        title: Text(
          'Your Order has been placed successfully',
          textAlign: TextAlign.center,
        ),
      ),
    );
    // Get.showDialog(AlertDialog(title: Text('Your Order has been placed successfully'),));
    Future.delayed(Duration(seconds: 2), () => Get.back());
  }
}
