import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_shortener/utility.dart';
import 'package:url_shortener/view/qr_code_details_screen.dart';

import '../../model/qr_code_model.dart';

class QrCodeTileWidget extends StatelessWidget {
  final QrCodeModel qrCodeModel;
  const QrCodeTileWidget({super.key, required this.qrCodeModel});

  @override
  Widget build(BuildContext context) {
    void pressQrCodeModelHandler() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => QrCodeDetailsScreen(qrCodeModel: qrCodeModel)));
    }

    return InkWell(
        onTap: pressQrCodeModelHandler,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: scaledHeight(16), horizontal: scaledWidth(16)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: scaledHeight(40),
                width: scaledWidth(40),
                padding: EdgeInsets.symmetric(
                    vertical: scaledHeight(10), horizontal: scaledWidth(10)),
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.all(Radius.circular(scaledHeight(8))),
                    border: Border.all(
                      width: scaledHeight(1),
                      color: const Color(0xffF6F6F9),
                    )),
                child: Image(
                    image: const AssetImage("assets/images/qr_code_icon.png"),
                    height: scaledHeight(20),
                    width: scaledWidth(20)),
              ),
              SizedBox(width: scaledWidth(16)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(qrCodeModel.name,
                      style: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff343446))),
                  SizedBox(height: scaledHeight(4)),
                  Text(qrCodeModel.address,
                      style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff1B48DA)))
                ],
              )
            ],
          ),
        ));
  }
}
