import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
//import 'package:flutter_e_commerce/utils/constants/colors.dart';

import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
//import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/constants/text_strings.dart';
//import 'package:flutter_e_commerce/utils/device/device_utility.dart';
//import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
//import 'package:iconsax/iconsax.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/sdpon_boarding_dot_navigation.dart';
import '../widgets/sdpon_boarding_next_button.dart';
import '../widgets/sdpon_boarding_page.dart';
import '../widgets/sdpon_boarding_skip.dart';

class SdpOnBoardingScreen extends StatelessWidget {
  const SdpOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SdpOnBoardingController());

    return Scaffold(
        body: Stack(children: [
      ///Horizontal Scrollable pages
      PageView(
        controller: controller.pageController,
        onPageChanged: controller.updatePageIndicator,
        children: const [
          SdpOnBoardingPage(
            image: SdpImages.onBoardingImage1,
            title: SdpTexts.onBoardingTitle1,
            subtitle: SdpTexts.onBoardingSubTitle1,
          ),
          SdpOnBoardingPage(
            image: SdpImages.onBoardingImage2,
            title: SdpTexts.onBoardingTitle2,
            subtitle: SdpTexts.onBoardingSubTitle2,
          ),
          SdpOnBoardingPage(
            image: SdpImages.onBoardingImage3,
            title: SdpTexts.onBoardingTitle3,
            subtitle: SdpTexts.onBoardingSubTitle3,
          ),
        ],
      ),
      // Skip Button
      const OnBoardingSkip(),

      // Dot Navigation SmoothPageIndicator

      const SdpOnBoardingDotNavigation(),

      // Circular Button
      const SdpOnBoardingNextButton()
    ]));
  }
}
