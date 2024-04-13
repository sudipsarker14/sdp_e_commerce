import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce/common/widgets/images/sdp_circular_image.dart';
import 'package:flutter_e_commerce/common/widgets/products/ratings/rating_indicator.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class SdpUserReviewCard extends StatelessWidget {
  const SdpUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SdpCircularImage(image: SdpImages.userProfileImage1),
                const SizedBox(width: SdpSizes.spaceBtwItems),
                Text('Sudip Sarker',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: SdpSizes.spaceBtwItems),

        /// Review
        Row(
          children: [
            const SdpRatingBarIndicator(rating: 4),
            const SizedBox(width: SdpSizes.spaceBtwItems),
            Text('14 Nov 2024', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: SdpSizes.spaceBtwItems),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was abel to navigate and make purchases seamlessly. Great job!',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: ' Show less',
          trimCollapsedText: ' Show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: SdpColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: SdpColors.primary),
        ),
        const SizedBox(height: SdpSizes.spaceBtwItems),

        /// Company Review
        SdpRoundedContainer(
          backgroundColor: dark ? SdpColors.darkGrey : SdpColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(SdpSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("T's Store",
                        style: Theme.of(context).textTheme.titleMedium),
                    Text("02 Nov, 2024",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: SdpSizes.spaceBtwItems),
                const ReadMoreText(
                  'The user interface of the app is quite intuitive. I was abel to navigate and make purchases seamlessly. Great job!',
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' Show less',
                  trimCollapsedText: ' Show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: SdpColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: SdpColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: SdpSizes.spaceBtwSections)
      ],
    );
  }
}
