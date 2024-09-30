class LinkModel {
  // int id;
  String name;
  String address;

  LinkModel({
    // required this.id,
    required this.name,
    required this.address,
  });

  factory LinkModel.fromJson(Map<String, dynamic> json) =>
      LinkModel(name: json["name"], address: json["address"]);
}
