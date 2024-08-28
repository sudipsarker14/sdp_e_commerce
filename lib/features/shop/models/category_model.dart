import 'package:cloud_firestore/cloud_firestore.dart';

class SdpCategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  SdpCategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
  });

  // Empty Helper Function
  static SdpCategoryModel empty() =>
      SdpCategoryModel(id: '', image: '', name: '', isFeatured: false);

  // Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  // Map Json oriented document snapshot from Firebase to UserModel
  factory SdpCategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the Model
      return SdpCategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return SdpCategoryModel.empty();
    }
  }
}
