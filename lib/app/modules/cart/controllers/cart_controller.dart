import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/data/services/database_services.dart';
import 'package:nowapps_machine_test/app/modules/take_order/model/product.dart';

class CartController extends GetxController {
  RxList<Product> cartItems = <Product>[].obs;
  final RxDouble total = 0.0.obs;

  @override
  void onInit() async {
    super.onInit();
    qtyChanger();
    log('ഇതൊക്കെ എന്തു ${cartItems}');
  }

  qtyChanger() async {
    total.value = 0.0;
    cartItems.value = await getCartItems();
    for (var element in cartItems) {
      total.value += double.parse(element.price) * double.parse(element.quantity);
    }
    // cartItems.listen((event) {
    //   total.value = event.fold(
    //       0.0,
    //       (previous, element) =>
    //           previous +
    //           double.parse(element.price) * double.parse(element.quantity));
    // });
    log(total.toString());
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
