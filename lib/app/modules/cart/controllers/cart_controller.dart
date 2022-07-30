import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nowapps_machine_test/app/data/services/database_services.dart';
import 'package:nowapps_machine_test/app/modules/take_order/model/product.dart';

class CartController extends GetxController {
  
  RxList<Product> cartItems = <Product>[].obs;
  final RxDouble total = 0.0.obs;
  final getStorage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    qtyChanger();
  }

  qtyChanger() async {
    total.value = 0.0;
    cartItems.value = await getCartItems();

    for (var element in cartItems) {      //To calculate total amount in cart
      total.value +=
          double.parse(element.price) * double.parse(element.quantity);
    }

    log(total.toString());
  }

  buyNow() {
    Get.dialog(AlertDialog(
      title: Text(
        'Your Order has been placed successfully',
        textAlign: TextAlign.center,
      ),
    ));

    getStorage.write('checkoutPermission', 'granted');      //without checkout permission == granted, user can't checkout 

    Future.delayed(Duration(seconds: 2), () => Get.back());
  }

  @override
  void onClose() {}
}
