import 'package:flutter/material.dart';
import 'package:url_shortener/utility.dart';
import 'package:url_shortener/view/components/app_bar_widget.dart';
import 'package:url_shortener/view/components/qr_codes_group_widget.dart';

class QrCodesScreen extends StatelessWidget {
  const QrCodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(isHomeButtonActive: true),
      backgroundColor: const Color(0xfff8f9fa),
      body: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(scaledWidth(16)),
            child: const Column(
                    children: [
                      QrCodesGroupWidget()
                    ],
                  ),
          )),
    );
  }
}
