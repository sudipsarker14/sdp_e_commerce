import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class SdpRatingAndShare extends StatelessWidget {
  const SdpRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///Rating
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: SdpSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: '5.0 ', style: Theme.of(context).textTheme.bodyLarge),
                const TextSpan(text: '(199)'),
              ]),
            )
          ],
        )
      ],
    );
  }
}
