import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/shimmers/shimmer.dart';
import 'package:flutter_e_commerce/features/shop/controllers/banner_controller.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/sdp_rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';

class SdpPromoSlider extends StatelessWidget {
  const SdpPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SdpBannerController());
    return Obx(() {
      // Loader
      if (controller.isLoading.value) {
        return const SdpShimmerEffect(width: double.infinity, height: 190);
      }

      // No data found
      if (controller.banners.isEmpty) {
        return const Center(child: Text('No Data Found'));
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index)),
              items: controller.banners
                  .map((banners) => SdpRoundedImage(
                        imageUrl: banners.imageUrl,
                        isNetworkImage: true,
                        onPressed: () => Get.toNamed(banners.targetScreen),
                      ))
                  .toList(),
            ),
            const SizedBox(height: SdpSizes.spaceBtwItems),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      SdpCircularContainer(
                          width: 7,
                          height: 7,
                          margin: const EdgeInsets.only(right: 10),
                          backgroundColor:
                              controller.carousalCurrentIndex.value == i
                                  ? SdpColors.primary
                                  : SdpColors.grey)
                  ],
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}
