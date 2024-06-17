import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/common/widgets/images/sdp_rounded_image.dart';
import 'package:flutter_e_commerce/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:flutter_e_commerce/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';

class SdpSubCategoryScreen extends StatelessWidget {
  const SdpSubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SdpAppbar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SdpSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const SdpRoundedImage(
                  width: double.infinity,
                  imageUrl: SdpImages.promoBanner3,
                  applyImageRadius: true),
              const SizedBox(height: SdpSizes.spaceBtwSections),

              /// Sub-Catagories
              Column(
                children: [
                  /// Heading
                  SdpSectionHeading(title: 'Sports shirts', onPressed: () {}),
                  const SizedBox(height: SdpSizes.spaceBtwItems / 2),
                  ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: SdpSizes.spaceBtwItems),
                      itemBuilder: ((context, index) =>
                          const SdpProductCardHorizontal())),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
