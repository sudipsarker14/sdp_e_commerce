import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class SdpSocialButtons extends StatelessWidget {
  const SdpSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: SdpColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
                width: SdpSizes.iconMd,
                height: SdpSizes.iconMd,
                image: AssetImage(SdpImages.google)),
          ),
        ),
        const SizedBox(height: SdpSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: SdpColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: SdpSizes.iconMd,
              height: SdpSizes.iconMd,
              image: AssetImage(SdpImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
