import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowapps_machine_test/app/routes/app_pages.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  List a = [
    'Reliance',
    'Adithya Birla',
    'Louis Philippe',
    'Raymond',
    'Pantaloons',
    'Morty Irlam',
    'Arrow',
    'Rick Sanchez',
    'Morty Smith',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retailers'),
        centerTitle: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: a.length,
        itemBuilder: (context, index) {
          return RetailerCard(a: a, index: index,controller: controller,);
        },
      ),
    );
  }
}

class RetailerCard extends StatelessWidget {
  const RetailerCard({
    Key? key,
    required this.index,
    required this.a,
    required this.controller,
  }) : super(key: key);

  final List a;
  final int index;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 142, 169, 191),
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
        // height: 100,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/channel_connect_logo.webp',
                    height: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        a[index],
                        style: TextStyle(),
                      ),
                      Text(a[index]),
                      Text(a[index]),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              width: 90.w,
              child: ElevatedButton(
                onPressed: () {
                  controller.checkinToRetailer(a[index]);
                  // Get.offAllNamed(Routes.CHECKED_IN, arguments: a[index]);
                },
                child: Text('Check In'),
              ),
            ),
            SizedBox(height: 8)
          ],
        ),
      ),
      // ),
    );
  }
}
