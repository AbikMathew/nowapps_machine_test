import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/modules/take_order/controllers/take_order_controller.dart';
import 'package:sizer/sizer.dart';

import '../controllers/cart_controller.dart';
import '../widgets/car_product_card.dart';

class CartView extends GetView<CartController> {
  final takeOrderController = Get.find<TakeOrderController>();
  
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          centerTitle: true,
        ),
        body: controller.cartItems.isEmpty
            ? Center(
                child: Text('No Products are added to the cart'),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.cartItems.length,
                      itemBuilder: (context, index) {
                        return CartProductCard(index: index);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        totalAmountColumn(),
                        buyNowButton(),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Row totalAmountColumn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total',
          style: TextStyle(fontSize: 25),
        ),
        Text(
          '₹ ${controller.total}',
          style: TextStyle(fontSize: 25),
        ),
        // Text('data'),
      ],
    );
  }

  SizedBox buyNowButton() {
    return SizedBox(
      width: 95.w,
      child: ElevatedButton(
        onPressed: () {
          controller.buyNow();
        },
        child: Text('Buy Now'),
      ),
    );
  }
}
