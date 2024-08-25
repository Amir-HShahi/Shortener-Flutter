import 'package:flutter/material.dart';
import 'package:url_shortener/view/components/app_bar_widget.dart';

class QrCodesScreen extends StatelessWidget {
  const QrCodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(isHomeButtonActive: true),
      body: SafeArea(
          child: Column(
        children: [Container(color: Colors.black, height: 10, width: 10)],
      )),
    );
  }
}
