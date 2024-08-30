import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_e_commerce/common/widgets/shimmers/shimmer.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';

class SdpVerticalProductShimmer extends StatelessWidget {
  const SdpVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SdpGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Image
                  SdpShimmerEffect(width: 180, height: 180),
                  SizedBox(height: SdpSizes.spaceBtwItems),

                  // Text
                  SdpShimmerEffect(width: 160, height: 15),
                  SizedBox(height: SdpSizes.spaceBtwItems / 2),
                  SdpShimmerEffect(width: 110, height: 15),
                ],
              ),
            ));
  }
}
