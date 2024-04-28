import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';

class SdpBillingPaymentSection extends StatelessWidget {
  const SdpBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SdpSectionHeading(
            title: 'Payment Method', buttonTitle: 'Change', onPressed: () {}),
        const SizedBox(height: SdpSizes.spaceBtwItems / 2),
        Row(
          children: [
            SdpRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? SdpColors.light : SdpColors.white,
              padding: const EdgeInsets.all(SdpSizes.sm),
              child: const Image(
                  image: AssetImage(SdpImages.paypal), fit: BoxFit.contain),
            ),
            const SizedBox(height: SdpSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}
