import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_commerce/features/shop/models/brand_model.dart';
import 'package:flutter_e_commerce/features/shop/models/product_attribute_model.dart';
import 'package:flutter_e_commerce/features/shop/models/product_variation_model.dart';

class SdpProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  SdpBrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<SdpProductAttributeModel>? productAttributes;
  List<SdpProductVariationModel>? productVariations;

  SdpProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.00,
    this.isFeatured,
    this.categoryId,
    this.description,
    this.productAttributes,
    this.productVariations,
  });

  // Create Empty func clean code
  static SdpProductModel empty() => SdpProductModel(
      id: '', title: '', stock: 0, price: 0, thumbnail: '', productType: '');

  // Json Format
  toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand!.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
    };
  }

  // Map Json oriented document snapshot from firebase to Model
  factory SdpProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return SdpProductModel.empty();
    final data = document.data()!;
    return SdpProductModel(
      id: document.id,
      sku: data['SKU'],
      title: data['Title'],
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: SdpBrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((e) => SdpProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => SdpProductVariationModel.fromJson(e))
          .toList(),
    );
  }
}
