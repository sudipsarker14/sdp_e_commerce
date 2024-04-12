import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/icons/sdp_circular_icon.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SdpBottomAddToCartWidget extends StatelessWidget {
  const SdpBottomAddToCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: SdpSizes.defaultSpace,
          vertical: SdpSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? SdpColors.darkGrey : SdpColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(SdpSizes.cardRadiusLg),
            topRight: Radius.circular(SdpSizes.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SdpCircularIcon(
                icon: FontAwesomeIcons.minus,
                backgroundColor: SdpColors.darkGrey,
                width: 40,
                height: 40,
                color: SdpColors.white,
              ),
              const SizedBox(width: SdpSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: SdpSizes.spaceBtwItems),
              const SdpCircularIcon(
                icon: FontAwesomeIcons.plus,
                backgroundColor: SdpColors.darkGrey,
                width: 40,
                height: 40,
                color: SdpColors.white,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(SdpSizes.md),
                backgroundColor: SdpColors.black,
                side: const BorderSide(color: SdpColors.black),
              ),
              child: const Text('Add to Cart'))
        ],
      ),
    );
  }
}
