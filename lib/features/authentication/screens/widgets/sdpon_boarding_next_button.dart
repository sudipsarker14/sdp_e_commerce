import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SdpOnBoardingNextButton extends StatelessWidget {
  const SdpOnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return Positioned(
      right: SdpSizes.defaultSpace,
      bottom: SdpDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => SdpOnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? SdpColors.primary : SdpColors.black),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
