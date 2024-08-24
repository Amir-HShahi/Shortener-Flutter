import 'package:flutter/material.dart';
import 'package:url_shortener/utility.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});
  void pressHomeButtonHandler() {
    //push to home screen
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          GestureDetector(
            onTap: pressHomeButtonHandler,
            child: Image(
                image: const AssetImage("assets/images/home_screen_button.png"),
                height: scaledHeight(16)),
          ),
          SizedBox(width: scaledWidth(16))
        ],
      ),
    );
  }
}
