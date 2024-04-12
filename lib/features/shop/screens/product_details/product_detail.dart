import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter_e_commerce/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:flutter_e_commerce/common/widgets/icons/sdp_circular_icon.dart';
import 'package:flutter_e_commerce/common/widgets/images/sdp_rounded_image.dart';
import 'package:flutter_e_commerce/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:flutter_e_commerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:flutter_e_commerce/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';
import 'package:flutter_e_commerce/utils/constants/sizes.dart';
import 'package:flutter_e_commerce/utils/helpers/helper_functions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';

class SdpProductDetailScreen extends StatelessWidget {
  const SdpProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SdpHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Iage Slider
            SdpProductImageSlider(),

            /// 2 - Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: SdpSizes.defaultSpace,
                  left: SdpSizes.defaultSpace,
                  bottom: SdpSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share Button
                  SdpRatingAndShare(),

                  /// Price, Title, Stack, & Brand
                  SdpProductMetaData(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
