import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/app_pages.dart';
import '../../take_order/views/take_order_view.dart';
import '../controllers/cart_controller.dart';
import '../widgets/quantity_changer.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                                Text(
                                  "₹100",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20),
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
              },
              itemCount: 5,
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
