import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:url_shortener/model/link_model.dart';
import 'package:url_shortener/services/http_handler.dart';

class LinkViewModel with ChangeNotifier {
  List<LinkModel> links = [];

  void updateLinks() async {
    String linksAsJson = "";
    await fetchLinks().then((value) => {linksAsJson = value});

    var list = jsonDecode(linksAsJson) as List;
    links.removeRange(0, links.length);
    for (var model in list.reversed) {
      links.add(LinkModel(
          name: model["name"], address: model["url"], id: model["number"]));
    }
    notifyListeners();
  }
}
