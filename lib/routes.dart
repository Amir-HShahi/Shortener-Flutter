import 'package:flutter/material.dart';
import 'package:url_shortener/view/analytics_screen.dart';
import 'package:url_shortener/view/create_qr_code_screen.dart';
import 'package:url_shortener/view/dashboard.dart';
import 'package:url_shortener/view/qr_code_details_screen.dart';
import 'package:url_shortener/view/qr_codes_screen.dart';

Map<String, Widget Function(BuildContext)> routesData = {
  "/DashboardScreen": (context) => const Dashboard(),
  "/QrCodesScreen": (context) => const QrCodesScreen(),
  "/QrCodeDetailsScreen": (context) => const QrCodeDetailsScreen(),
  "/AnalyticsScreen": (context) => const AnalyticsScreen(),
  "/CreateQrCodeScreen": (context) => const CreateQrCodeScreen()
};
