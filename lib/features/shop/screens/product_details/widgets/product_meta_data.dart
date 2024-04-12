import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce/common/widgets/images/sdp_circular_image.dart';
import 'package:flutter_e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:flutter_e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:flutter_e_commerce/common/widgets/texts/title_with_verified_icon.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/enums.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';

class SdpProductMetaData extends StatelessWidget {
  const SdpProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            SdpRoundedContainer(
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
            const SizedBox(width: SdpSizes.spaceBtwItems),

            /// Price
            Text('\$250',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: SdpSizes.spaceBtwItems),
            const SdpProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: SdpSizes.spaceBtwItems / 1.5),

        /// Title
        const SdpProductTitletext(title: "Green Nike Sports Shirt"),
        const SizedBox(height: SdpSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const SdpProductTitletext(title: 'Status'),
            const SizedBox(width: SdpSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: SdpSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            SdpCircularImage(
              image: SdpImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: dark ? SdpColors.white : SdpColors.black,
            ),
            const SdpBrandTitleWithVerifiedIcon(
                title: 'Nike', brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}
