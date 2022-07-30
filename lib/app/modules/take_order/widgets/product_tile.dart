import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/modules/cart/controllers/cart_controller.dart';
import 'package:nowapps_machine_test/app/modules/take_order/widgets/product_name_and_price.dart';
import 'package:sizer/sizer.dart';

import '../../../data/services/database_services.dart';
import '../controllers/take_order_controller.dart';
import 'add_to_cart_button.dart';
import 'img_widget.dart';

class ProductTile extends StatelessWidget {
  ProductTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  final controller = Get.find<TakeOrderController>();
  final cartController = Get.find<CartController>();
  final int index;

  @override
  Widget build(BuildContext context) {
    final product = controller.productResponse!.data!.products![index];

    return Container(
      height: 18.h,
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
              ImgWidget(product: product),
              SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductNameAndPrice(product: product),
                  Obx(() {
                    if (cartController.inCartIDs.contains(index)) {
                      return SizedBox(
                          width: 130,
                          child: QuantityChanger(
                              index: cartController.inCartIDs.indexOf(index)));
                    } else {
                      return AddToCartButton(
                        product: product,
                        index: index,
                      );
                    }
                  })
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QuantityChanger extends StatelessWidget {
  final int index;
  final controller = Get.find<CartController>();
  final takeOrderController = Get.find<TakeOrderController>();
  QuantityChanger({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = controller.cartItems[index];

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
                await decreaseQty(productID: product.id!);
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
                await increseQty(product.id!);
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
