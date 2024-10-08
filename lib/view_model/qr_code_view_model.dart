import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:url_shortener/model/qr_code_model.dart';
import 'package:url_shortener/services/shared_preferences.dart';

class QrCodeViewModel with ChangeNotifier {
  List<QrCodeModel> qrCodes = [];

  void addQrCode(String name, String address) {
    qrCodes.add(QrCodeModel(name: name, address: address));
    updateLocalDatabase();
    notifyListeners();
  }

  void loadLocalDatabase() async {
    final prefs = await getSharedPreferences();
    List<String>? mappedQrCodes = prefs.getStringList("qrCodes");
    if(mappedQrCodes != null) {
      var loadedQrCodes = _fromStringListToQrCodeModel(mappedQrCodes);
      qrCodes = loadedQrCodes;
    }
    notifyListeners();
  }

  void updateLocalDatabase() {
    saveListKeyValue("qrCodes", objectToJsonStringList(qrCodes));
  }

  List<QrCodeModel> _fromStringListToQrCodeModel(List<String> mappedQrCodes)  {
    return mappedQrCodes
        .map((model) => QrCodeModel.fromJson(jsonDecode(model)))
        .toList();
  }
}
