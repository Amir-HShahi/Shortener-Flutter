import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_shortener/utility.dart';

class CustomizedFloatingButton extends StatelessWidget {
  final IconData buttonIcon;
  final String title;
  final Function() onTap;
  const CustomizedFloatingButton(
      {super.key,
      required this.buttonIcon,
      required this.title,
      required this.onTap});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: scaledHeight(40),
        width: scaledWidth(345),
        decoration: BoxDecoration(
          color: const Color(0xff1B48DA),
          borderRadius: BorderRadius.all(Radius.circular(scaledHeight(6))),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(buttonIcon, size: scaledHeight(20), color: Colors.white),
            SizedBox(width: scaledWidth(4)),
            Text(title,
                style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white))
          ],
        ),
      ),
    );
  }
}
