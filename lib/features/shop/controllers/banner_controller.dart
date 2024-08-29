import 'package:flutter_e_commerce/data/repositories/banners/banner_repository.dart';
import 'package:flutter_e_commerce/features/shop/models/banner_model.dart';
import 'package:flutter_e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class SdpBannerController extends GetxController {
  // Variable
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<SdpBannerModel> banners = <SdpBannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  // Update Page Navigational Dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  // Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch Banners
      final bannerRepo = Get.put(SdpBannerRepository());
      final banners = await bannerRepo.fechBanners();

      // Assign Banners
      this.banners.assignAll(banners);
    } catch (e) {
      SdpLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }
}
