import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/common/widgets/brands/brand_card.dart';
import 'package:flutter_e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_e_commerce/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce/features/shop/screens/brands/brand_products.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:get/get.dart';

class SdpAllBrandsScreen extends StatelessWidget {
  const SdpAllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SdpAppbar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SdpSizes.defaultSpace),
          child: Column(children: [
            /// Heading
            const SdpSectionHeading(title: 'Brands'),
            const SizedBox(height: SdpSizes.spaceBtwItems),

            /// Brands
            SdpGridLayout(
              itemCount: 10,
              mainAxisExtent: 80,
              itemBuilder: (context, index) => SdpBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const SdpBrandProduct())),
            ),
          ]),
        ),
      ),
    );
  }
}
