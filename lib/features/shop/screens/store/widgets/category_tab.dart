import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/brands/brand_show_case.dart';
import 'package:flutter_e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter_e_commerce/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce/features/shop/models/category_model.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';

class SdpCategoryTab extends StatelessWidget {
  const SdpCategoryTab({super.key, required this.category});

  final SdpCategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(SdpSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              const SdpBrandShowCase(images: [
                SdpImages.productImage12,
                SdpImages.productImage14,
                SdpImages.productImage20
              ]),
              const SdpBrandShowCase(images: [
                SdpImages.productImage18,
                SdpImages.productImage15,
                SdpImages.productImage25
              ]),
              const SizedBox(height: SdpSizes.spaceBtwItems),

              /// Products
              SdpSectionHeading(title: 'You migth like', onPressed: () {}),
              const SizedBox(height: SdpSizes.spaceBtwItems),

              SdpGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const SdpProductCardVertical()),
              const SizedBox(height: SdpSizes.spaceBtwItems),
            ],
          ),
        ),
      ],
    );
  }
}
