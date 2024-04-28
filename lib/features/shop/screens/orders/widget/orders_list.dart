import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SdpOrderListItems extends StatelessWidget {
  const SdpOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, __) =>
          const SizedBox(height: SdpSizes.spaceBtwItems),
      itemBuilder: (_, index) => SdpRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(SdpSizes.md),
        backgroundColor: dark ? SdpColors.dark : SdpColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Row
            Row(
              children: [
                /// 1 - Icon
                const Icon(FontAwesomeIcons.ship),
                const SizedBox(width: SdpSizes.spaceBtwItems / 2),

                /// 2 - Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: SdpColors.primary, fontWeightDelta: 1),
                      ),
                      Text('07 Nov 2024',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),

                /// 3 - Icon
                IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.arrowRight,
                        size: SdpSizes.iconSm))
              ],
            ),
            const SizedBox(width: SdpSizes.spaceBtwItems),

            /// Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - Icon
                      const Icon(FontAwesomeIcons.tag),
                      const SizedBox(width: SdpSizes.spaceBtwItems / 2),

                      /// 2 - Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text('[#256f2]',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - Icon
                      const Icon(FontAwesomeIcons.calendarDay),
                      const SizedBox(width: SdpSizes.spaceBtwItems / 2),

                      /// 2 - Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text('03 Feb 2025',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
