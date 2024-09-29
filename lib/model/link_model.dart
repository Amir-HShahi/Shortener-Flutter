class LinkModel {
  int id;
  String name;
  String address;

  LinkModel({
    required this.id,
    required this.name,
    required this.address,
  });

  factory LinkModel.fromJsom(Map<String, dynamic> json) =>
      LinkModel(id: json["id"], name: json["name"], address: json["address"]);
}
