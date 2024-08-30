class SdpProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  SdpProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  // Create Empty func for clean code
  static SdpProductVariationModel empty() =>
      SdpProductVariationModel(id: '', attributeValues: {});

  // Json Format
  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'SKU': sku,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  // Map Json oriented document snapshot from Firebase model
  factory SdpProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return SdpProductVariationModel.empty();
    return SdpProductVariationModel(
      id: data['Id'] ?? '',
      price: double.parse((data['Price'] ?? 0.0).toString()),
      sku: data['SKU'] ?? '',
      stock: data['Stock'] ?? 0,
      salePrice: double.parse((data['Price'] ?? 0.0).toString()),
      image: data['Image'] ?? '',
      attributeValues: Map<String, String>.from(data['AttributeValues']),
    );
  }
}
