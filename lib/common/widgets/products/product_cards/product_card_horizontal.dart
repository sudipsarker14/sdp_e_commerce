import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_e_commerce/common/styles/shadows.dart';
import 'package:flutter_e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce/common/widgets/icons/sdp_circular_icon.dart';
import 'package:flutter_e_commerce/common/widgets/images/sdp_rounded_image.dart';
import 'package:flutter_e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:flutter_e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:flutter_e_commerce/common/widgets/texts/title_with_verified_icon.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';

class SdpProductCardHorizontal extends StatelessWidget {
  const SdpProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SdpSizes.productImageRadius),
        color: dark ? SdpColors.darkerGrey : SdpColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          SdpRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(SdpSizes.sm),
            backgroundColor: dark ? SdpColors.dark : SdpColors.light,
            child: Stack(
              children: [
                /// Thumnail Image
                const SizedBox(
                    height: 120,
                    width: 120,
                    child: SdpRoundedImage(
                        imageUrl: SdpImages.productImage27,
                        applyImageRadius: true)),

                /// Sale tag

                Positioned(
                  top: 12,
                  child: SdpRoundedContainer(
                    radius: SdpSizes.sm,
                    backgroundColor: SdpColors.secondary.withOpacity(0.8),
                    padding: EdgeInsets.symmetric(
                        horizontal: SdpSizes.sm, vertical: SdpSizes.xs),
                    child: Text('25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: SdpColors.black)),
                  ),
                ),

                /// Favorite Icon Button
                const Positioned(
                    top: 0,
                    right: 0,
                    child: SdpCircularIcon(
                        icon: FontAwesomeIcons.heart, color: Colors.red)),
              ],
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.only(top: SdpSizes.sm, left: SdpSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SdpProductTitletext(
                          title: 'Green Nike Half Sleeves Shirt',
                          smallSize: true),
                      SizedBox(height: SdpSizes.spaceBtwSections / 2),
                      SdpBrandTitleWithVerifiedIcon(title: 'Nike')
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      const Flexible(
                          child: const SdpProductPriceText(price: '256.0')),

                      /// Add to Cart Button
                      Container(
                        decoration: const BoxDecoration(
                          color: SdpColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(SdpSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(SdpSizes.productImageSize),
                          ),
                        ),
                        child: const SizedBox(
                          width: SdpSizes.iconLg * 1.2,
                          height: SdpSizes.iconLg * 1.2,
                          child: Center(
                              child: Icon(
                            Iconsax.add,
                            color: SdpColors.white,
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
