import 'package:flutter/material.dart';
import 'package:url_shortener/utility.dart';

class QrCodesScreen extends StatelessWidget {
  const QrCodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Image(
      //     image: const AssetImage("assets/images/app_bar_icon.png"),
      //     height: scaledHeight(2),
      //     width: scaledWidth(1),
      //   ),
      // ),
      body:  SafeArea(child: Image(
          image: const AssetImage("assets/images/app_bar_icon.png"),
          height: scaledHeight(100),
          width: scaledWidth(50),
        )),
    );
  }
}
