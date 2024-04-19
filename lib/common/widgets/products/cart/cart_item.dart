import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/images/sdp_rounded_image.dart';
import 'package:flutter_e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:flutter_e_commerce/common/widgets/texts/title_with_verified_icon.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';

class SdpCartItem extends StatelessWidget {
  const SdpCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        SdpRoundedImage(
          imageUrl: SdpImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(SdpSizes.sm),
          backgroundColor: SdpHelperFunctions.isDarkMode(context)
              ? SdpColors.darkerGrey
              : SdpColors.light,
        ),
        const SizedBox(width: SdpSizes.spaceBtwItems),

        /// Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SdpBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                  child: SdpProductTitletext(
                title: 'Black Sports shoes',
                maxLines: 1,
              )),

              /// Attributes
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: 'Color  ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: 'Green  ',
                      style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(
                      text: 'Size  ',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: 'UK 08  ',
                      style: Theme.of(context).textTheme.bodyLarge),
                ]),
              )
            ],
          ),
        )
      ],
    );
  }
}
