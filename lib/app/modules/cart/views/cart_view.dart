import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/modules/take_order/controllers/take_order_controller.dart';
import 'package:nowapps_machine_test/app/modules/take_order/model/product.dart';
import 'package:sizer/sizer.dart';

// import '../../../routes/app_pages.dart';
import '../../take_order/views/take_order_view.dart';
import '../controllers/cart_controller.dart';
import '../widgets/quantity_changer.dart';

// import 'package:get/get.dart';
class CartView extends GetView<CartController> {
  final takeOrderController = Get.find<TakeOrderController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: takeOrderController.product.value.isEmpty
          ? Center(child: Text('No Products are added to the cart'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CartProductCard(
                          controller: takeOrderController,
                          product:
                              takeOrderController.product.value.values[1],
                          quatity:
                              takeOrderController.product.value.values.toList()[index],
                          index: index);
                    },
                    itemCount: takeOrderController.product.value.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            '₹ 200',
                            style: TextStyle(fontSize: 25),
                          ),
                          // Text('data'),
                        ],
                      ),
                      SizedBox(
                        width: 95.w,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Buy Now'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final TakeOrderController controller;
  final Product product;
  final int quatity;
  final int index;

  const CartProductCard({
    Key? key,
    required this.controller,
    required this.product,
    required this.quatity,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child: Image.network(image),
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
                        'Redmi K20 Pro',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Text(
                      "₹100",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 115,
                height: 40,
                child: QuantityChanger(
                  color: Colors.blue,
                  onPressed: () {},
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: Container(
            //     width: 105,
            //     height: 30,
            //     child: ElevatedButton(
            //       child: Text('Add to Cart'),
            //       onPressed: () {
            //         // controller.addToCart(index);
            //       },
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
