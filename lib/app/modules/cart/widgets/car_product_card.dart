import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/modules/cart/widgets/quantity_changer.dart';
import 'package:sizer/sizer.dart';

import '../../take_order/controllers/take_order_controller.dart';
import '../controllers/cart_controller.dart';

class CartProductCard extends StatelessWidget {
  // final CartController controller;
  final int index;

  final takeOrderController = Get.find<TakeOrderController>();
  final cartController = Get.find<CartController>();
  CartProductCard({
    Key? key,
    // required this.controller,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cartProduct = cartController.cartItems[index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 17.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 174, 204, 228),
        ),
        padding: EdgeInsets.all(8),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32.w,
                  width: 32.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      cartProduct.image,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images/no_image.jpg');
                      },
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 55.w,
                      child: Text(
                        cartProduct.name!,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Text(
                      cartProduct.price,
                      style: TextStyle(color: Colors.red, fontSize: 17),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 125,
                height: 40,
                child: QuantityChanger(
                  index: index,
                  color: Colors.blue,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
