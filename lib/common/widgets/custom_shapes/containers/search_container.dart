import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SdpSearchContainer extends StatelessWidget {
  const SdpSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SdpSizes.defaultSpace),
        child: Container(
          width: SdpDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(SdpSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? SdpColors.dark
                    : SdpColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(SdpSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: SdpColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: SdpColors.darkerGrey),
              const SizedBox(width: SdpSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
