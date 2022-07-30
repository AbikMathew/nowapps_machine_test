import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/data/services/database_services.dart';
import 'package:nowapps_machine_test/app/modules/cart/controllers/cart_controller.dart';
import 'package:nowapps_machine_test/app/modules/take_order/controllers/take_order_controller.dart';

// import 'package:sizer/sizer.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class QuantityChanger extends StatelessWidget {
  // final Color color;
  // final VoidCallback onPressed;
  final int index;
  final controller = Get.find<CartController>();
  final takeOrderController = Get.find<TakeOrderController>();
  QuantityChanger({
    Key? key,
    required this.index,
    // required this.color,
    // required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _product = controller.cartItems[index];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blue,
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () async {
                await decreaseQty(productID: _product.id!);
                controller.qtyChanger();
              },
              child: controller.cartItems[index].quantity == '1'
                  ? Text(
                      'Remove',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
            ),
            Text(
              controller.cartItems[index].quantity == '1'
                  ? ''
                  : controller.cartItems[index].quantity.toString(),
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
              onPressed: (() async {
                await increseQty(_product.id!);
                controller.qtyChanger();
              }),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
