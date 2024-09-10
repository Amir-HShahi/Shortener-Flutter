import 'package:flutter/material.dart';
import 'package:sortenet/gen/assets.gen.dart';
import 'package:sortenet/view/dashboard.dart';

class AppBarWidget extends PreferredSize {
  const AppBarWidget({super.key})
      : super(
            preferredSize: const Size(double.infinity, 64),
            child: const MyAppBar());
}

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  // void searchHandler() {}
  void dashboardPageHandler() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const Dashboard(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color.fromARGB(240, 246, 246, 249),
      toolbarHeight: 64,
      title: Row(
        children: [
          Image.asset(Assets.images.logo.path),
          const SizedBox(
            width: 8,
          ),
          Image.asset(Assets.images.shortener.path),
          // Expanded(
          //   child: Align(
          //     alignment: Alignment.centerRight,
          //     child: InkWell(
          //       onTap: searchHandler,
          //       child: ImageIcon(
          //         AssetImage(Assets.icons.search.path),
          //         size: 20,
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: dashboardPageHandler,
                child: ImageIcon(
                  AssetImage(Assets.icons.home.path),
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
