import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_shortener/utility.dart';
import 'package:url_shortener/view/components/qr_code_tile_widget.dart';

class QrCodesGroupWidget extends StatelessWidget {
  const QrCodesGroupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: scaledWidth(16)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: scaledWidth(16)),
            child: Text(
              "QR Codes",
              style:
                  GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: scaledHeight(16)),
          const _DividerLineWidget(),
          const QrCodeTileWidget(),
          const _DividerLineWidget(),
        ],
      ),
    );
  }
}

class _DividerLineWidget extends StatelessWidget {
  const _DividerLineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: scaledHeight(1),
        color: const Color(0xffF6F6F9),
    );
  }
}

