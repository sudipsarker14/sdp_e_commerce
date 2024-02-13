import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SdpLogiHeader extends StatelessWidget {
  const SdpLogiHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image:
              AssetImage(dark ? SdpImages.lightAppLogo : SdpImages.darkAppLogo),
        ),
        Text(SdpTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: SdpSizes.sm),
        Text(SdpTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
