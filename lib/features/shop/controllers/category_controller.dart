import 'package:flutter_e_commerce/data/repositories/categories/category_repository.dart';
import 'package:flutter_e_commerce/features/shop/models/category_model.dart';
import 'package:flutter_e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class SdpCategoryController extends GetxController {
  static SdpCategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _catrgoryRepository = Get.put(SdpCategoryRepository());
  RxList<SdpCategoryModel> allCategories = <SdpCategoryModel>[].obs;
  RxList<SdpCategoryModel> featuredCategories = <SdpCategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  // Load categories data
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore, API, etc)
      final categories = await _catrgoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories.where(
          (category) => category.isFeatured && category.parentId.isEmpty));
    } catch (e) {
      SdpLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }
}
