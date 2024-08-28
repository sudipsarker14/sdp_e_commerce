import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:flutter_e_commerce/common/widgets/shimmers/category_shimmer.dart';
import 'package:flutter_e_commerce/features/shop/controllers/category_controller.dart';
import 'package:flutter_e_commerce/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter_e_commerce/utils/constants/colors.dart';
import 'package:get/get.dart';

class SdpHomeCategories extends StatelessWidget {
  const SdpHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(SdpCategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) return const SdpCategoryShimmer();

      if (categoryController.featuredCategories.isEmpty) {
        return Center(
            child: Text('No Data Found!',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: SdpColors.white)));
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return SdpVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => const SdpSubCategoryScreen()),
              );
            }),
      );
    });
  }
}
