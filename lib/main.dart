import 'package:flutter/material.dart';
import 'package:url_shortener/routes.dart';
import 'package:url_shortener/utility.dart';
import 'package:url_shortener/view/analytics_screen.dart';
import 'package:url_shortener/view/qr_codes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeScreenData(context);
    return MaterialApp(
      home: const AnalyticsScreen(),
      routes: routesData,
    );
  }
}