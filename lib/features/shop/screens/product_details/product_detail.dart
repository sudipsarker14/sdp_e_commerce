import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/texts/section_heading.dart';
import 'package:flutter_e_commerce/features/shop/models/product_model.dart';
import 'package:flutter_e_commerce/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:flutter_e_commerce/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:flutter_e_commerce/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:flutter_e_commerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:flutter_e_commerce/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:flutter_e_commerce/features/shop/screens/product_rating/product_rating.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SdpProductDetailScreen extends StatelessWidget {
  const SdpProductDetailScreen({super.key, required this.product});

  final SdpProductModel product;

  @override
  Widget build(BuildContext context) {
    // final dark = SdpHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const SdpBottomAddToCartWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Iage Slider
            const SdpProductImageSlider(),

            /// 2 - Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: SdpSizes.defaultSpace,
                  left: SdpSizes.defaultSpace,
                  bottom: SdpSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share Button
                  const SdpRatingAndShare(),

                  /// Price, Title, Stack, & Brand
                  const SdpProductMetaData(),

                  /// Attributes
                  const SdpProductAttributes(),
                  const SizedBox(height: SdpSizes.spaceBtwSections),

                  /// Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: SdpSizes.spaceBtwSections),

                  /// Description
                  const SdpSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: SdpSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a product description for Blue Nike Sleeve less vest. There are more thingsthat can be added but i am not insterested now to anything. Thank You',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                  const Divider(),
                  const SizedBox(height: SdpSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SdpSectionHeading(
                          title: 'Reviews (199)', showActionButton: true),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const SdpProductRating()),
                          icon: (const Icon(
                            FontAwesomeIcons.arrowRight,
                            size: 18,
                          ))),
                    ],
                  ),
                  const SizedBox(height: SdpSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
