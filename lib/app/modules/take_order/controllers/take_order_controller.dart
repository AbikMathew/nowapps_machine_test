import 'dart:developer';

import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/data/services/api_services.dart';
import 'package:nowapps_machine_test/app/data/services/database_services.dart';
import 'package:nowapps_machine_test/app/modules/cart/controllers/cart_controller.dart';
import 'package:nowapps_machine_test/app/modules/take_order/model/product.dart';
import 'package:nowapps_machine_test/app/modules/take_order/model/product_response.dart';

class TakeOrderController extends GetxController {
  var isProductLoading = false.obs;
  ProductResponse? productResponse;
  final CartController cartController = Get.put(CartController());

  void addProduct(Product product, int index) async {
    await addToCart(product, index);
    cartController.qtyChanger();

    Get.closeAllSnackbars();

    Get.snackbar(
      'Product Added',
      'You have added  to the cart',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

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

        isProductLoading.value = false;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onClose() {}
}
