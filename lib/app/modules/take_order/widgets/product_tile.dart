import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/modules/take_order/model/product_response.dart';
import 'package:sizer/sizer.dart';

import '../controllers/take_order_controller.dart';
import '../model/product.dart';

class ProductTile extends StatelessWidget {
  ProductTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  final controller = Get.find<TakeOrderController>();
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
              NoImage(product: product),
              SizedBox(width: 8),
              ProductNameAndPrice(product: product),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: AddToCartButton(index: index, product: product),
          )
        ],
      ),
    );
  }
}

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

class ProductNameAndPrice extends StatelessWidget {
  const ProductNameAndPrice({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 55.w,
          child: Text(
            product.prodName!,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
        Text(
          '₹ ${product.prodMrp}',
          style: TextStyle(color: Colors.red, fontSize: 17),
        ),
      ],
    );
  }
}

class NoImage extends StatelessWidget {
  const NoImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Products product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.w,
      width: 32.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          product.prodImage!,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Image.asset('assets/images/no_image.jpg');
          },
        ),
      ),
    );
  }
}
