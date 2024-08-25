import 'package:flutter/material.dart';
import 'package:url_shortener/utility.dart';

class AppBarWidget extends PreferredSize {
  final bool isHomeButtonActive;
  AppBarWidget({super.key, required this.isHomeButtonActive})
      : super(
            preferredSize: Size(double.infinity, scaledHeight(60)),
            child: MyAppBar(isHomeButtonActive: isHomeButtonActive));
}

class MyAppBar extends StatelessWidget {
  final bool isHomeButtonActive;
  const MyAppBar({super.key, required this.isHomeButtonActive});
  void pressHomeButtonHandler() {
    //push to home screen
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: scaledHeight(64),
        width: double.infinity,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: scaledWidth(16)),
            Image(
                image: const AssetImage("assets/images/app_bar_icon.png"),
                height: scaledHeight(32)),
            SizedBox(width: scaledWidth(8)),
            Image(
                image: const AssetImage("assets/images/app_bar_typo_icon.png"),
                height: scaledHeight(22)),
            const Spacer(),
            isHomeButtonActive
                ? GestureDetector(
                    onTap: pressHomeButtonHandler,
                    child: Image(
                        image: const AssetImage(
                            "assets/images/home_screen_button.png"),
                        height: scaledHeight(18)),
                  )
                : const SizedBox(),
            SizedBox(width: scaledWidth(16))
          ],
        ),
      ),
    );
  }
}
