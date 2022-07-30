import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/data/services/api_services.dart';
import 'package:nowapps_machine_test/app/data/services/database_services.dart';
import 'package:nowapps_machine_test/app/modules/take_order/model/product.dart';
import 'package:nowapps_machine_test/app/modules/take_order/model/product_response.dart';

class TakeOrderController extends GetxController {
  var isProductLoading = false.obs;
  ProductResponse? productResponse;

// Add a dictionary to store the products in the cart
  var _products = {}.obs;

  void addProduct(Product product, int index) async {
    await addToCart(product, index);

    Get.snackbar(
      'Product Added',
      'You have added  to the cart',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      duration: Duration(milliseconds: 1500),
    );
  }

  // void removeProduct(Product product) {
  //   var productQuantity = _products[product.id][0];
  //   // log(productQuantity.toString());

  //   if (_products.containsKey(product.id) && productQuantity == 1) {
  //     log('kerunnundoo');
  //     log(product.id.toString());
  //     _products.removeWhere((key, value) => key == product.id);
  //   } else {
  //     _products[product.id][0]--;
  //     log(_products[product.id][0].toString());
  //   }
  // }

  get product => _products;

// get productSubTotal

// get productTotal
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  fetchProducts() async {
    isProductLoading.value = true;
    try {
      final response = await ApiServices().getProducts();
      if (response.statusCode == 200) {
        productResponse = ProductResponse.fromJson(response.data);
        log(productResponse!.data!.products![0].prodMrp.toString());
        // = response.data;
        // log(response.data.toString());
        isProductLoading.value = false;
      }
    } catch (e) {
      log(' onnunm illa');
    }
  }

  @override
  void onClose() {}
}
