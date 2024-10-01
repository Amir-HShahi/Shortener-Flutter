import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:url_shortener/model/link_model.dart';
import 'package:url_shortener/services/http_handler.dart';

class LinkViewModel with ChangeNotifier {
  static List<LinkModel> links = [];

  static void updateLinks() async {
    String linksAsJson = "damn it";
    await fetchLinks().then((value) => {linksAsJson = value});

    var l = jsonDecode(linksAsJson) as List;
    links.removeRange(0, links.length);
    for(var gg in l.reversed) {
      links.add(LinkModel(name: "${gg["number"]}", address: gg["url"]));
    }
  }
}
