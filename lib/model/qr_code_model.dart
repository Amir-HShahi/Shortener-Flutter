class QrCodeModel {
  final String name;
  final String address;
  QrCodeModel({required this.name, required this.address});

  factory QrCodeModel.fromJson(Map<String, dynamic> json) =>
      QrCodeModel(name: json["name"], address: json["address"]);

  Map<String, dynamic> toJson() => {"name": name, "address": address};
}
