import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/checked_in_controller.dart';

class CustomMenuItem extends StatelessWidget {
  CustomMenuItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.color = Colors.blue,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final Color color;

  final controller = Get.find<CheckedInController>();
  @override
  Widget build(BuildContext context) {
    return
        // Obx((() => controller.count == 2
        //     ?
        InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Obx(() {
            //   if (controller.color.value == Colors.blue) {
            //     return Icon(icon, color: color);
            //   }
            //   return Icon(icon, color: color);
            // }),
            CircleAvatar(
              backgroundColor: color ,
              radius: 35,
              child: Icon(
                icon,
                size: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
