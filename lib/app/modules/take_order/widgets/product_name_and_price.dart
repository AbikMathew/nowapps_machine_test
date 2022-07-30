import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../model/product_response.dart';

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
          style: TextStyle(color: Colors.red, fontSize: 16),
        ),
      ],
    );
  }
}