import 'package:flutter_e_commerce/features/personalization/screens/settings/settings.dart';
import 'package:flutter_e_commerce/features/shop/screens/store/store.dart';
import 'package:flutter_e_commerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:get/get.dart';

import '../features/shop/screens/home/home.dart';

class SdpNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const SdpHomeScreen(),
    const SdpStoreScreen(),
    const SdpWishListScreen(),
    const SdpSettingsScreen(),
  ];
}
