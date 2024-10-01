import 'package:flutter/cupertino.dart';
import 'package:url_shortener/model/qr_code_model.dart';

class QrCodeViewModel with ChangeNotifier {
  final List<QrCodeModel> _qrCodes = [];

  void addQrCode(String name, String address) {
    _qrCodes.add(QrCodeModel(name: name, address: address));
  }
}