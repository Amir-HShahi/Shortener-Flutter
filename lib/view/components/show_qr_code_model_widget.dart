import 'package:flutter/material.dart';
import 'package:url_shortener/utility.dart';

class ShowQrCodeModelWidget extends StatelessWidget {
  const ShowQrCodeModelWidget({super.key});

  void pressQrCodeModelHandler() {}

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: pressQrCodeModelHandler,
        child: Container(
          height: 90,
          padding: EdgeInsets.symmetric(
              vertical: scaledHeight(16), horizontal: scaledWidth(16)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: scaledHeight(40),
                width: scaledWidth(40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(scaledHeight(8))),
                    border: Border.all(
                      width: scaledHeight(1),
                      color: const Color(0xffF6F6F9),
                    )),
              )
            ],
          ),
        ));
  }
}
