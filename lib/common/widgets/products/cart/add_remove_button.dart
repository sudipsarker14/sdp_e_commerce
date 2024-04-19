import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/icons/sdp_circular_icon.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SdpProductQuantityWithAddRemoveButton extends StatelessWidget {
  const SdpProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SdpCircularIcon(
          icon: FontAwesomeIcons.minus,
          width: 32,
          height: 32,
          size: SdpSizes.md,
          color: SdpHelperFunctions.isDarkMode(context)
              ? SdpColors.white
              : SdpColors.black,
          backgroundColor: SdpHelperFunctions.isDarkMode(context)
              ? SdpColors.darkerGrey
              : SdpColors.light,
        ),
        const SizedBox(width: SdpSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: SdpSizes.spaceBtwItems),
        const SdpCircularIcon(
          icon: FontAwesomeIcons.plus,
          width: 32,
          height: 32,
          size: SdpSizes.md,
          color: SdpColors.white,
          backgroundColor: SdpColors.primary,
        ),
      ],
    );
  }
}
