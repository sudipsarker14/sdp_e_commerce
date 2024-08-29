import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter_e_commerce/features/shop/screens/all_products/all_products.dart';
import 'package:flutter_e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flutter_e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:flutter_e_commerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class SdpHomeScreen extends StatelessWidget {
  const SdpHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        ///Header
        const SdpPrimaryHeaderContainer(
          child: Column(
            children: [
              /// -- Appbar ---
              SdpHomeAppBar(),

              SizedBox(height: SdpSizes.spaceBtwSections),

              /// --Searchbar ---
              SdpSearchContainer(text: 'Search in Store'),
              SizedBox(height: SdpSizes.spaceBtwSections),

              /// -- Categories --
              Padding(
                padding: EdgeInsets.only(left: SdpSizes.defaultSpace),
                child: Column(
                  children: [
                    /// -- Heading
                    SdpSectionHeading(
                      title: 'Popular Categories',
                      showActionButton: false,
                      textColor: SdpColors.white,
                    ),
                    SizedBox(height: SdpSizes.spaceBtwItems),

                    /// Categories
                    SdpHomeCategories(),
                    SizedBox(height: SdpSizes.spaceBtwSections),
                  ],
                ),
              ),
            ],
          ),
        ),

        /// Body
        Padding(
          padding: const EdgeInsets.all(SdpSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Promo Slider ---
              const SdpPromoSlider(),

              /// Heading
              SdpSectionHeading(
                  title: 'Popular Products',
                  onPressed: () => Get.to(() => const SdpAllProducts())),
              const SizedBox(height: SdpSizes.spaceBtwItems),

              /// Popular Products
              SdpGridLayout(
                  itemCount: 2,
                  itemBuilder: (_, index) => const SdpProductCardVertical()),
            ],
          ),
        ),
      ]),
    ));
  }
}
