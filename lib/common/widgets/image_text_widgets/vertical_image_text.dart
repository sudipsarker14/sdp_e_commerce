import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/images/sdp_circular_image.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class SdpVerticalImageText extends StatelessWidget {
  const SdpVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = SdpColors.white,
    this.backgroundColor,
    this.onTap, 
    this.isNetworkImage = true,
  });
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: SdpSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            SdpCircularImage(
             image: image,
             fit: BoxFit.fitWidth,
             padding: SdpSizes.sm * 1.4,
             isNetworkImage: isNetworkImage,
              overlayColor: SdpHelperFunctions.isDarkMode(context) ?
                     SdpColors.white : SdpColors.black,
              ),
          
            /// Text
            const SizedBox(height: SdpSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
     )
    ),
      );
    
  }
}
