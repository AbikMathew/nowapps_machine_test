import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/take_order_controller.dart';
import '../model/product.dart';
import '../model/product_response.dart';

class AddToCartButton extends StatelessWidget {
  AddToCartButton({
    Key? key,
    required this.index,
    required this.product,
  }) : super(key: key);

  final controller = Get.find<TakeOrderController>();
  final int index;
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 30,
      child: ElevatedButton(
        child: Text('Add to Cart'),
        onPressed: () {
          controller.addProduct(
              Product(
                  id: index,
                  name: product.prodName,
                  price: product.prodMrp!,
                  image: product.prodImage!,
                  quantity: '1'),
              index);
        },
      ),
    );
  }
}
