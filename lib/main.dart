import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/model/qr_code_model.dart';
import 'package:url_shortener/providers.dart';
import 'package:url_shortener/routes.dart';
import 'package:url_shortener/themes.dart';
import 'package:url_shortener/utility.dart';
import 'package:url_shortener/view/dashboard.dart';
import 'package:url_shortener/view_model/qr_code_view_model.dart';

void main() {
  runApp(MultiProvider(providers: providersData, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeScreenData(context);

    var qrCodeViewModel = context.read<QrCodeViewModel>();
    qrCodeViewModel.loadLocalDatabase();

    return MaterialApp(
      home: const Dashboard(),
      theme: themesData,
      routes: routesData,
    );
  }
}
