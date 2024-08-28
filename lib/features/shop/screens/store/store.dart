import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/tabbar.dart';
import 'package:flutter_e_commerce/common/widgets/brands/brand_card.dart';
import 'package:flutter_e_commerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_e_commerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:flutter_e_commerce/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce/features/shop/controllers/category_controller.dart';
import 'package:flutter_e_commerce/features/shop/screens/brands/all_brands.dart';
import 'package:flutter_e_commerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class SdpStoreScreen extends StatelessWidget {
  const SdpStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = SdpCategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: SdpAppbar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            SdpCartCounterIcon(
              onPressed: () {},
              iconColor: SdpColors.black,
            )
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: SdpHelperFunctions.isDarkMode(context)
                      ? SdpColors.black
                      : SdpColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(SdpSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        /// Search bar
                        const SizedBox(height: SdpSizes.spaceBtwItems),
                        const SdpSearchContainer(
                            text: 'Search in Store',
                            showBorder: true,
                            showBackground: false),
                        const SizedBox(height: SdpSizes.spaceBtwSections),

                        /// Featured Brands
                        SdpSectionHeading(
                            title: 'Featured Brands',
                            onPressed: () =>
                                Get.to(() => const SdpAllBrandsScreen())),
                        const SizedBox(height: SdpSizes.spaceBtwItems / 1.5),

                        /// Brands Grid

                        SdpGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return const SdpBrandCard(showBorder: false);
                            })
                      ],
                    ),
                  ),

                  /// Tabs
                  bottom: SdpTabBar(
                    tabs: categories.map((category) => Tab(child: Text(category.name))).toList()
                  ),
                ),
              ];
            },

            ///  Body
            body:  TabBarView(
              children: categories.map((category) => SdpCategoryTab(category: category)).toList()      
            )),
      ),
    );
  }
}
