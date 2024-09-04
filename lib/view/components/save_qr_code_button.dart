import 'package:flutter/cupertino.dart';
import 'package:url_shortener/utility.dart';

class SaveQrCodeButton extends StatelessWidget {
  const SaveQrCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: scaledHeight(32),
      width: scaledWidth(200),
    );
  }
}
