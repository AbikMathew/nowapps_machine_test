import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';

class RetailerCard extends StatelessWidget {
  RetailerCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 218, 228, 226),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                retailerLogoImg(),
                retailerName(),
              ],
            ),
            checkInButton(),
            SizedBox(height: 8)
          ],
        ),
      ),
      // ),
    );
  }

  SizedBox checkInButton() {
    return SizedBox(
      width: 90.w,
      child: ElevatedButton(
        onPressed: () {
          controller.checkIn(index);
        },
        child: Text('Check In'),
      ),
    );
  }

  Padding retailerName() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            controller.retailersList[index],
            style: TextStyle(color: Colors.blue, fontSize: 25),
          ),
        ],
      ),
    );
  }

  Padding retailerLogoImg() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        'assets/images/realiance_logo.jpg',
        height: 120,
      ),
    );
  }
}
