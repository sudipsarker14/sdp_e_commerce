import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/brands/brand_card.dart';
import 'package:flutter_e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';

class SdpBrandShowCase extends StatelessWidget {
  const SdpBrandShowCase({
    super.key,
    required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SdpRoundedContainer(
      showBorder: true,
      borderColor: SdpColors.darkGrey,
      padding: const EdgeInsets.all(SdpSizes.md),
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: SdpSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with Product Count
          const SdpBrandCard(showBorder: false),
          const SizedBox(height: SdpSizes.spaceBtwItems),

          /// Brand Top 3 Product Images
          Row(
              children: images
                  .map((image) => brandTopProductImageWWidget(image, context))
                  .toList()),
        ],
      ),
    );
  }

  Widget brandTopProductImageWWidget(String image, context) {
    return Expanded(
        child: SdpRoundedContainer(
      height: 100,
      backgroundColor: SdpHelperFunctions.isDarkMode(context)
          ? SdpColors.darkGrey
          : SdpColors.light,
      margin: const EdgeInsets.only(right: SdpSizes.sm),
      padding: const EdgeInsets.all(SdpSizes.md),
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ));
  }
}
