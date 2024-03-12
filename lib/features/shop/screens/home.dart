import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/shop/screens/widgets/home_appbar.dart';
import 'package:flutter_e_commerce/features/shop/screens/widgets/home_categories.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/device/device_utility.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';

import '../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../common/widgets/texts/section_heading.dart';

class SdpHomeScreen extends StatelessWidget {
  const SdpHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        ///Header
        SdpPrimaryHeaderContainer(
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
                    SdpHomeCategories()
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
