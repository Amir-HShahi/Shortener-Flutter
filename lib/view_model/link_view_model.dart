import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:url_shortener/model/link_model.dart';
import 'package:url_shortener/services/http_handler.dart';

class LinkViewModel with ChangeNotifier {
  static List<LinkModel> links = [];

  static void updateLinks() async {
    String linksAsJson = "damn it";
    await fetchLinks().then((value) => {linksAsJson = value});

    // list.map((object) => LinkModel.fromJson(json.decode(object))).toList()
    Iterable l = json.decode(linksAsJson);
    List<LinkModel> fetchedLinks =
        List<LinkModel>.from(l.map((model) => LinkModel.fromJson(model)));
    links = fetchedLinks;
  }
}
