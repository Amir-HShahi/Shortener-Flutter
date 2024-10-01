import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_shortener/view/components/customized_floating_button.dart';

import '../utility.dart';
import 'components/app_bar_widget.dart';

class QrCodeDetailsScreen extends StatelessWidget {
  const QrCodeDetailsScreen({super.key});

  void saveToGalleryHandler() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(isHomeButtonActive: false),
      backgroundColor: const Color(0xfff8f9fa),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomizedFloatingButton(
          buttonIcon: Icons.download_rounded,
          title: "Save to gallery",
          onTap: saveToGalleryHandler),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(scaledWidth(16)),
              child: Column(
                children: [
                  SizedBox(height: scaledHeight(32)),
                  Container(
                    padding: EdgeInsets.all(scaledHeight(16)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.all(Radius.circular(scaledHeight(32))),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 4), // changes position of shadow
                          ),
                        ]),
                    child: QrImageView(
                      data: '1234567890',
                      version: QrVersions.auto,
                      size: scaledWidth(200),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
