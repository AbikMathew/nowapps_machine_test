import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/modules/take_order/model/product.dart';
import 'package:nowapps_machine_test/app/routes/app_pages.dart';
import 'package:sizer/sizer.dart';
import '../controllers/take_order_controller.dart';

class TakeOrderView extends GetView<TakeOrderController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text('Take Order'),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Get.toNamed(Routes.CART);
                },
              ),
            ],
          ),
          body: controller.isProductLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductTile(controller: controller, index: index),
                    );
                  },
                  itemCount: 5,
                ),
        ));
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);
  final TakeOrderController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    final product = controller.productResponse!.data!.products![index];
    return Container(
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
                    product.prodImage.toString(),
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset('assets/images/no_image.jpg');
                    },
                  ),
                  // child: Image(image: NetworkImage('')),
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
                      product.prodName.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  Text(
                    '₹ ${product.prodMrp.toString()}',
                    style: TextStyle(color: Colors.red, fontSize: 17),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 105,
              height: 30,
              child: ElevatedButton(
                child: Text('Add to Cart'),
                onPressed: () {
                  controller.addProduct(
                    Product(
                      name: product.prodName.toString(),
                      price: double.parse(product.prodMrp!),
                      image: product.prodImage.toString(),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

var image = 'https://m.media-amazon.com/images/I/71yNpxGXbML._SL1500_.jpg';
// var image =
//     'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/er3fy2kvscq02yt8sqij';
