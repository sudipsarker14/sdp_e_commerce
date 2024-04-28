import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SdpBillingAddressSection extends StatelessWidget {
  const SdpBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SdpSectionHeading(
            title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {}),
        Text('Sudip Sarker', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: SdpSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(FontAwesomeIcons.phone, color: Colors.grey, size: 16),
            const SizedBox(height: SdpSizes.spaceBtwItems),
            Text('+92-317-8059525',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: SdpSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(height: SdpSizes.spaceBtwItems),
            Expanded(
                child: Text('Souh Liana, Maine 87695, USA',
                    style: Theme.of(context).textTheme.bodyMedium,
                    softWrap: true))
          ],
        )
      ],
    );
  }
}
