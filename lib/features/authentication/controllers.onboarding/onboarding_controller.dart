import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../screens/login/login.dart';

class SdpOnBoardingController extends GetxController {
  static SdpOnBoardingController get instance => Get.find();

  /// Variables

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update Current Index & Jump to next page

  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();

      if (kDebugMode) {
        print(
            '========================== Get Storage Next Button ================');
        print(storage.read('IsFirstTime'));
      }

      storage.write('IsFirstTime', false);

      if (kDebugMode) {
        print(
            '========================== Get Storage Next Button ================');
        print(storage.read('IsFirstTime'));
      }

      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index & Jump to the last page
  void skipPage() {
    Get.offAll(const LoginScreen());
    //int page = currentPageIndex.value = 2;
    // pageController.jumpToPage(page);
  }
}
