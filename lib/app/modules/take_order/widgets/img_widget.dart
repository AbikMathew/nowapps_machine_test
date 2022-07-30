import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../model/product_response.dart';

class ImgWidget extends StatelessWidget {
  const ImgWidget({
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
            return Image.asset('assets/images/dryer.jpg');
          },
        ),
      ),
    );
  }
}
