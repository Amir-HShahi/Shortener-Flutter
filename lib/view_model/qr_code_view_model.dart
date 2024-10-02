import 'package:flutter/cupertino.dart';
import 'package:url_shortener/model/qr_code_model.dart';
import 'package:url_shortener/services/shared_preferences.dart';

class QrCodeViewModel with ChangeNotifier {
  final List<QrCodeModel> qrCodes = [];

  void addQrCode(String name, String address) {
    qrCodes.add(QrCodeModel(name: name, address: address));
    updateLocalDatabase();
    notifyListeners();
  }

  void updateLocalDatabase() {
    saveListKeyValue("qrCodes", objectToJsonStringList(qrCodes));
  }
}
