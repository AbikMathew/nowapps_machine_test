import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/modules/take_order/widgets/appbar_cart.dart';
import '../controllers/take_order_controller.dart';
import '../widgets/product_tile.dart';

class TakeOrderView extends GetView<TakeOrderController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text('Take Order'),
            actions: [
              CartIcon(),
            ],
          ),
          body: controller.isProductLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTile(index: index),
                    );
                  },
                  itemCount: 5,
                ),
        ));
  }
}
