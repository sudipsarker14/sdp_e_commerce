import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/shimmers/shimmer.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';

class SdpCategoryShimmer extends StatelessWidget {
  const SdpCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) =>
              const SizedBox(width: SdpSizes.spaceBtwItems),
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                SdpShimmerEffect(width: 55, height: 55, redius: 55),
                SizedBox(height: SdpSizes.spaceBtwItems / 2),

                // Text
                SdpShimmerEffect(width: 55, height: 8)
              ],
            );
          }),
    );
  }
}
