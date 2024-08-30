import 'package:flutter_e_commerce/data/repositories/products/product_repository.dart';
import 'package:flutter_e_commerce/features/shop/models/product_model.dart';
import 'package:flutter_e_commerce/utils/constants/enums.dart';
import 'package:flutter_e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class SdpProductController extends GetxController {
  static SdpProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(SdpProductRepository());
  RxList<SdpProductModel> featuredProducts = <SdpProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      // Show loader while loading Products
      isLoading.value = true;

      // Fetch Products
      final products = await productRepository.getFeaturedProducts();

      // Assign Products
      featuredProducts.assignAll(products);
    } catch (e) {
      SdpLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Get the product price or price range for variation
  String getProductPrice(SdpProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variations exits, return the sample price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      // Calculate the smallest and larget price among variations
      for (var variation in product.productVariations!) {
        // Determine the price to consider (sale price if available, otherwise regular price)
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // Update smallest and largest prices
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      // smallest and larget prices are the same, return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        // Otherwise, return a price range
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  // Calculate Discount Percentange
  String? calculateSalePercentange(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  // Check Product Stock Status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
