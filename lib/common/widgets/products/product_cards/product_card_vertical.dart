import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/styles/shadows.dart';
import 'package:flutter_e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce/common/widgets/icons/sdp_circular_icon.dart';
import 'package:flutter_e_commerce/common/widgets/images/sdp_rounded_image.dart';
import 'package:flutter_e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:flutter_e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:flutter_e_commerce/common/widgets/texts/title_with_verified_icon.dart';
import 'package:flutter_e_commerce/features/shop/controllers/product_controller.dart';
import 'package:flutter_e_commerce/features/shop/models/product_model.dart';
import 'package:flutter_e_commerce/features/shop/screens/product_details/product_detail.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/enums.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SdpProductCardVertical extends StatelessWidget {
  const SdpProductCardVertical({super.key, required this.product});

  final SdpProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = SdpProductController.instance;
    final salePercentage =
        controller.calculateSalePercentange(product.price, product.salePrice);
    final dark = SdpHelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => SdpProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [SdpShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(SdpSizes.productImageRadius),
          color: dark ? SdpColors.darkerGrey : SdpColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            SdpRoundedContainer(
              width: 180,
              height: 180,
              padding: const EdgeInsets.all(SdpSizes.sm),
              backgroundColor: dark ? SdpColors.dark : SdpColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  Center(
                    child: SdpRoundedImage(
                        imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true),
                  ),

                  /// Sale tag

                  Positioned(
                    top: 12,
                    child: SdpRoundedContainer(
                      radius: SdpSizes.sm,
                      backgroundColor: SdpColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: SdpSizes.sm, vertical: SdpSizes.xs),
                      child: Text('$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: SdpColors.black)),
                    ),
                  ),

                  /// Favorite Icon Button
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: SdpCircularIcon(
                          icon: Iconsax.heart5, color: Colors.red)),
                ],
              ),
            ),
            const SizedBox(height: SdpSizes.spaceBtwItems / 2),

            /// Details
            Padding(
              padding: const EdgeInsets.only(left: SdpSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SdpProductTitletext(title: product.title, smallSize: true),
                  const SizedBox(height: SdpSizes.spaceBtwItems / 2),
                  SdpBrandTitleWithVerifiedIcon(title: product.brand!.name),
                ],
              ),
            ),
            // Todo: Add Spacer() hare to keep the height of each Box soe in case 1 or 2 Lines of Headings
            const Spacer(),

          // Price Row
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, 
             children: [
             
              ///Price
              Flexible(
                child: Column(
                  children: [
                    if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: SdpSizes.sm),
                      child: Text(
                        product.price.toString(),
                        style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                      ),
                    ),


                    // Price, show sale price as main price if sale exist
                    Padding(
                      padding: const EdgeInsets.only(left: SdpSizes.sm),
                      child: SdpProductPriceText(
                        price: controller.getProductPrice(product),
                      ),
                    ),
                  ],
                ),
              ),

              /// Add to Cart Button
              Container(
                decoration: const BoxDecoration(
                  color: SdpColors.dark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(SdpSizes.cardRadiusMd),
                    bottomRight: Radius.circular(SdpSizes.productImageSize),
                  ),
                ),
                child: const SizedBox(
                  width: SdpSizes.iconLg * 1.2,
                  height: SdpSizes.iconLg * 1.2,
                  child: Center(
                      child: Icon(
                    Iconsax.add,
                    color: SdpColors.white,
                  )),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
