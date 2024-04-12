import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/chips/choice_chip.dart';
import 'package:flutter_e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:flutter_e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:flutter_e_commerce/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';

class SdpProductAttributes extends StatelessWidget {
  const SdpProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// Selected Attribute Pricing & Description
        SdpRoundedContainer(
          padding: const EdgeInsets.all(SdpSizes.md),
          backgroundColor: dark ? SdpColors.darkGrey : SdpColors.grey,
          child: Column(
            children: [
              /// Title, Price, Stack Staus
              Row(
                children: [
                  const SdpSectionHeading(
                      title: 'Variation', showActionButton: false),
                  const SizedBox(width: SdpSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SdpProductTitletext(
                              title: 'Price : ', smallSize: true),

                          /// Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: SdpSizes.spaceBtwItems),

                          /// Sale Price
                          const SdpProductPriceText(price: '20'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const SdpProductTitletext(
                              title: 'Stock : ', smallSize: true),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation Description
              const SdpProductTitletext(
                title:
                    'This is the Description of the Product and it can go up to max 4 lines',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: SdpSizes.spaceBtwItems),

        /// Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SdpSectionHeading(title: 'Colors'),
            const SizedBox(height: SdpSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                SdpChoiceChips(
                    text: 'Green', selected: false, onSelected: (value) {}),
                SdpChoiceChips(
                    text: 'Blue', selected: true, onSelected: (value) {}),
                SdpChoiceChips(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
                SdpChoiceChips(
                    text: 'Green', selected: false, onSelected: (value) {}),
                SdpChoiceChips(
                    text: 'Blue', selected: true, onSelected: (value) {}),
                SdpChoiceChips(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
                SdpChoiceChips(
                    text: 'Green', selected: false, onSelected: (value) {}),
                SdpChoiceChips(
                    text: 'Blue', selected: true, onSelected: (value) {}),
                SdpChoiceChips(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SdpSectionHeading(title: 'Size', showActionButton: false),
          const SizedBox(height: SdpSizes.spaceBtwItems / 2),
          Wrap(
            spacing: 8,
            children: [
              SdpChoiceChips(
                  text: 'EU 34', selected: true, onSelected: (value) {}),
              SdpChoiceChips(
                  text: 'EU 36', selected: false, onSelected: (value) {}),
              SdpChoiceChips(
                  text: 'EU 38', selected: false, onSelected: (value) {}),
              SdpChoiceChips(
                  text: 'EU 34', selected: true, onSelected: (value) {}),
              SdpChoiceChips(
                  text: 'EU 36', selected: false, onSelected: (value) {}),
              SdpChoiceChips(
                  text: 'EU 38', selected: false, onSelected: (value) {}),
              SdpChoiceChips(
                  text: 'EU 34', selected: true, onSelected: (value) {}),
              SdpChoiceChips(
                  text: 'EU 36', selected: false, onSelected: (value) {}),
              SdpChoiceChips(
                  text: 'EU 38', selected: false, onSelected: (value) {}),
            ],
          )
        ]),
      ],
    );
  }
}
