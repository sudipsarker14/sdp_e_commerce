import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/shop/screens/home.dart';

class SdpNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const SdpHomeScreen(),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.pink,
    ),
  ];
}
