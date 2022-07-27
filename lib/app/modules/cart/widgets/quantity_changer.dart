import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class QuantityChanger extends StatelessWidget {
  const QuantityChanger({
    Key? key,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
          Text(
            '3',
            // count.toString(),
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
