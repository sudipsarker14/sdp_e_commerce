import 'package:cloud_firestore/cloud_firestore.dart';

class SdpBannerModel {
  String imageUrl;
  final String targetScreen;
  final bool active;

  SdpBannerModel(
      {required this.imageUrl,
      required this.targetScreen,
      required this.active});

  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
      'Active': active,
    };
  }

  factory SdpBannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return SdpBannerModel(
        imageUrl: data['ImageUrl'] ?? '',
        targetScreen: data['TargetScreen'] ?? '',
        active: data['Active'] ?? false);
  }
}
