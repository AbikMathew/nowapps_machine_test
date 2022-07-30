import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  List retailersList = [
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
  var getStorage = GetStorage();

  checkIn(int index) {
    return Get.defaultDialog(
      title: 'Check In',
      content:
          Text('Are you sure you want to check in to ${retailersList[index]}?'),
      actions: [
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () => Get.back(),
        ),
        ElevatedButton(
          child: Text('Check In'),
          onPressed: () {
            checkinToRetailer(retailersList[index]);
            Get.back();
          },
        ),
      ],
    );
  }

  void checkinToRetailer(String retailerName) {
    getStorage.write('checked_in', true);
    getStorage.write('retailer_name', retailerName);
    Get.offAllNamed(Routes.CHECKED_IN, arguments: retailerName);
  }

  @override
  void onClose() {}
}
