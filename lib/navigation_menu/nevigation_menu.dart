import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

import 'Navigation_Controller.dart';

class SdpNavigationMenu extends StatelessWidget {
  const SdpNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SdpNavigationController());
    final darkmode = SdpHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 80,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkmode ? SdpColors.black : Colors.white,
          indicatorColor: darkmode
              ? SdpColors.white.withOpacity(0.1)
              : SdpColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "wishlist"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "profile"),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
