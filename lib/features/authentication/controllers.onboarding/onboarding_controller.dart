import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../screens/login/login.dart';

class SdpOnBoardingController extends GetxController {
  static SdpOnBoardingController get instance => Get.find();

  /// Variables

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when page Scroll
  void updatePageIndicator(index) => currentPageIndex = index;

  /// Jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update Current Index & Jump to next page

  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index & Jump to the last page
  void skipPage() {
    int page = currentPageIndex.value = 2;
    pageController.jumpToPage(page);
  }
}
