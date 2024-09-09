import 'package:flutter/material.dart';
import 'package:url_shortener/view/qr_code_details_screen.dart';
import 'package:url_shortener/view/qr_codes_screen.dart';

Map<String, Widget Function(BuildContext)> routesData = {
  "/QrCodesScreen": (context) => const QrCodesScreen(),
  "/QrCodeDetailsScreen": (context) => const QrCodeDetailsScreen()
};
