class SdpBrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  SdpBrandModel({
    required this.id,
    required this.image,
    required this.name,
    this.isFeatured,
    this.productCount,
  });

  // Empty Helper Function
  static SdpBrandModel empty() => SdpBrandModel(id: '', image: '', name: '');

  // Convert model to Json structure so that you can store data in Firebase
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productCount,
      'IsFeatured': isFeatured,
    };
  }

  // Map Json oriented document snapshot from Firebase to Brand Model
  factory SdpBrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return SdpBrandModel.empty();
    return SdpBrandModel(
        id: data['Id'] ?? '',
        image: data['Image'] ?? '',
        name: data['Name'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        productCount: int.parse((data['ProductsCount'] ?? 0).toString()),
        );
        
  }
}
