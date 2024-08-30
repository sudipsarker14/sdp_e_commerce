class SdpProductAttributeModel {
  String? name;
  final List<String>? values;

  SdpProductAttributeModel({this.name, this.values});

  // Json format
  toJson() {
    return {'Name': name, 'Values': values};
  }

  // Map Json oriented document snapshot from Firebase to Model
  factory SdpProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) return SdpProductAttributeModel();
    return SdpProductAttributeModel(
      name: data.containsKey('Name') ? data['Name'] : '',
      values: List<String>.from(data['Values']),
    );
  }
}
