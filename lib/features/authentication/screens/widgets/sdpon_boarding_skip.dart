import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: SdpDeviceUtils.getAppBarHeight(),
        right: SdpSizes.defaultSpace,
        child: TextButton(
          onPressed: () => SdpOnBoardingController.instance.skipPage(),
          child: const Text('Skip'),
        ));
  }
}
