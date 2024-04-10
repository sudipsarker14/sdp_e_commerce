import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce/common/widgets/images/sdp_circular_image.dart';
import 'package:flutter_e_commerce/common/widgets/texts/title_with_verified_icon.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/enums.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';

class SdpBrandCard extends StatelessWidget {
  const SdpBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = SdpHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: SdpRoundedContainer(
        padding: const EdgeInsets.all(SdpSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // Icon
            Flexible(
              child: SdpCircularImage(
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                image: SdpImages.clothIcon,
                overlayColor: isDark ? SdpColors.white : SdpColors.black,
              ),
            ),
            const SizedBox(width: SdpSizes.spaceBtwItems / 2),

            /// Text
            /// [Expanded] & Column [MainAxisSize.min] is important to keep thr elements in the vertical center and also
            /// to keep text inside the boundaries.
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SdpBrandTitleWithVerifiedIcon(
                      title: 'Nike', brandTextSize: TextSizes.large),
                  Text(
                    '256 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
