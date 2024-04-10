import 'package:flutter/material.dart';
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
import 'package:iconsax/iconsax.dart';

class SdpProductCardVertical extends StatelessWidget {
  const SdpProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius and shadow
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [SdpShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(SdpSizes.productImageRadius),
          color: dark ? SdpColors.darkerGrey : SdpColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            SdpRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(SdpSizes.sm),
              backgroundColor: dark ? SdpColors.dark : SdpColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  const SdpRoundedImage(
                      imageUrl: SdpImages.productImage1,
                      applyImageRadius: true),

                  /// Sale tag

                  Positioned(
                    top: 12,
                    child: SdpRoundedContainer(
                      radius: SdpSizes.sm,
                      backgroundColor: SdpColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
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
                          icon: Iconsax.heart5, color: Colors.red)),
                ],
              ),
            ),
            const SizedBox(height: SdpSizes.spaceBtwItems / 2),

            /// Details
            const Padding(
              padding: EdgeInsets.only(left: SdpSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SdpProductTitletext(
                      title: 'Green Nike Air Shoes', smallSize: true),
                  SizedBox(height: SdpSizes.spaceBtwItems / 2),
                  SdpBrandTitleWithVerifiedIcon(title: 'Nike'),
                ],
              ),
            ),
            // Todo: Add Spacer() hare to keep the height of each Box soe in case 1 or 2 Lines of Headings
            const Spacer(),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ///Price
              const Padding(
                padding: EdgeInsets.only(left: SdpSizes.sm),
                child: SdpProductPriceText(
                  price: '35.0',
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: SdpColors.dark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(SdpSizes.cardRadiusMd),
                    bottomRight: Radius.circular(SdpSizes.productImageSize),
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
              )
            ])
          ],
        ),
      ),
    );
  }
}
