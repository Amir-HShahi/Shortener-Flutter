import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../utility.dart';
import 'components/app_bar_widget.dart';

class QrCodeDetailsScreen extends StatelessWidget {
  const QrCodeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(isHomeButtonActive: false),
      backgroundColor: const Color(0xfff8f9fa),
      body: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(scaledWidth(16)),
            child: Column(
              children: [Container(
                decoration: BoxDecoration(

                ),
                child: QrImageView(
                  data: '1234567890',
                  version: QrVersions.auto,
                  size: double.infinity,
                ),
              )],
            ),
          )),
    );
  }
}
