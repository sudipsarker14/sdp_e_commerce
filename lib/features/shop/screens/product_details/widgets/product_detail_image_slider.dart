import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:flutter_e_commerce/common/widgets/icons/sdp_circular_icon.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../common/widgets/images/sdp_rounded_image.dart';

class SdpProductImageSlider extends StatelessWidget {
  const SdpProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return SdpCurvedEdgeWidget(
      child: Container(
        color: dark ? SdpColors.darkGrey : SdpColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(SdpSizes.productImageRadius * 2),
                child: Center(
                    child: Image(image: AssetImage(SdpImages.productImage38))),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: SdpSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    itemBuilder: (_, index) => SdpRoundedImage(
                          imageUrl: SdpImages.productImage22,
                          width: 80,
                          backgroundColor:
                              dark ? SdpColors.dark : SdpColors.white,
                          border: Border.all(color: SdpColors.primary),
                          padding: const EdgeInsets.all(SdpSizes.sm),
                        ),
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: SdpSizes.spaceBtwItems),
                    itemCount: 4,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics()),
              ),
            ),

            /// Appbar Icons
            const SdpAppbar(
              showBackArrow: true,
              actions: [
                SdpCircularIcon(icon: FontAwesomeIcons.heart, color: Colors.red)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
