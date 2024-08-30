import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_commerce/data/services/firebase_storage_service.dart';
import 'package:flutter_e_commerce/features/shop/models/product_model.dart';
import 'package:flutter_e_commerce/utils/constants/enums.dart';
import 'package:flutter_e_commerce/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_e_commerce/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

// Repository for managing product-related data and operations.
class SdpProductRepository extends GetxController {
  static SdpProductRepository get instance => Get.find();

  // Firestore instance for database interactions.
  final _db = FirebaseFirestore.instance;

  // Get limited featured products
  Future<List<SdpProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => SdpProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw SdpFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw SdpPlatformException(e.code).message;
    } catch (e) {
      throw 'Somrthing went wrong. Please try again';
    }
  }

  // Upload dummy data to the cloud Firebase
  Future<void> uploadDummyData(List<SdpProductModel> products) async {
    try {
      // Upload all the products along with their images
      final storage = Get.put(SdpFirebaseStorageService());

      // Loop through each product
      for (var product in products) {
        // Get image data link from local assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // Upload image and get its URL
        final url = await storage.uploadImageData(
            'Product/Images', thumbnail, product.thumbnail.toString());

        // Assign URL to product.thumnail attribute
        product.thumbnail = url;

        // Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            // Assign URL to product.thumbnail attribute
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        // Upload Variation Images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // Get image data link from local assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            // Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Image', assetImage, variation.image);

            // Assign URL to variation.image attribute
            variation.image = url;
          }
        }
        // Store product in Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
