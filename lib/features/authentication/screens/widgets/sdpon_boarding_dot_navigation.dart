import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SdpOnBoardingDotNavigation extends StatelessWidget {
  const SdpOnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SdpOnBoardingController.instance;
    final dark = SdpHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: SdpDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: SdpSizes.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? SdpColors.light : SdpColors.dark,
            dotHeight: 6),
      ),
    );
  }
}
