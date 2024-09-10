import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sortenet/gen/assets.gen.dart';
import 'package:sortenet/view/components/app_bar_widget.dart';
import 'package:sortenet/view/links_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void closeCardUpgrade() {}

  void upgradePageHandler() {}

  void linksPageHandler() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const LinksPage(),
    ));
  }

  void qrCodesPageHandler() {}
  void analyticsPageHandler() {}
  void supportPageHandler() {}
  void settingsPageHandler() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(),
        backgroundColor: const Color.fromARGB(240, 246, 246, 249),
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: size.width / 19.65,
                      left: size.width / 19.65,
                      top: size.height / 42.6),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(214, 239, 246, 255),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ImageIcon(
                                AssetImage(Assets.icons.home.path),
                                size: 18,
                                color: const Color.fromARGB(226, 27, 72, 218),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "Dashboard",
                                  style: textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      PageHandlerButton(
                        textTheme: textTheme,
                        onTab: linksPageHandler,
                        text: 'Links',
                        imageIcon: AssetImage(Assets.icons.links.path),
                        size: size,
                      ),
                      PageHandlerButton(
                        textTheme: textTheme,
                        onTab: qrCodesPageHandler,
                        text: 'QR Codes',
                        imageIcon: AssetImage(Assets.icons.qRCode.path),
                        size: size,
                      ),
                      PageHandlerButton(
                        textTheme: textTheme,
                        onTab: analyticsPageHandler,
                        text: 'Analytics',
                        imageIcon: AssetImage(Assets.icons.analytics.path),
                        size: size,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PageHandlerButton(
                        textTheme: textTheme,
                        onTab: supportPageHandler,
                        text: 'support',
                        imageIcon: AssetImage(Assets.icons.support.path),
                        size: size,
                      ),
                      PageHandlerButton(
                        textTheme: textTheme,
                        onTab: settingsPageHandler,
                        text: 'settings',
                        imageIcon: AssetImage(Assets.icons.settings.path),
                        size: size,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, size.height / 21.3),
                child: Container(
                  width: size.width,
                  height: 194,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "2/10 links available",
                                style: textTheme.titleMedium,
                              ),
                            ),
                            InkWell(
                                onTap: closeCardUpgrade,
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Enjoying Shortener? Consider upgrading your plan so you can go limitless.",
                          style: textTheme.displaySmall,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        LinearProgressIndicator(
                          value: 0.7,
                          backgroundColor: Colors.grey[300],
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(226, 27, 72, 218)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          minHeight: 8,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Upgrade now",
                                style: textTheme.bodySmall,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            InkWell(
                                onTap: upgradePageHandler,
                                child: const Icon(CupertinoIcons.arrow_right,
                                    color: Color.fromARGB(226, 27, 72, 218),
                                    size: 20))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: size.width,
                height: 72,
                color: const Color.fromARGB(240, 246, 246, 249),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            Assets.images.avatar.path,
                            scale: 2,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "John Doe",
                                  style: textTheme.headlineMedium,
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "Free account",
                                  style: textTheme.headlineSmall,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height / 25,
                        width: size.width / 5.61,
                        child: TextButton(
                            onPressed: upgradePageHandler,
                            style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                    const Color.fromARGB(155, 26, 205, 129)),
                                shape: WidgetStateProperty.all(
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))))),
                            child: Text(
                              "Upgrade",
                              style: textTheme.labelSmall,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageHandlerButton extends StatelessWidget {
  const PageHandlerButton({
    super.key,
    required this.textTheme,
    this.onTab,
    required this.text,
    required this.imageIcon,
    required this.size,
  });

  final TextTheme textTheme;
  final String text;
  final AssetImage imageIcon;
  final Size size;

  final Function()? onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: const Color.fromARGB(214, 239, 246, 255),
      onTap: onTab,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color.fromARGB(240, 246, 246, 249),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageIcon(
                imageIcon,
                size: 18,
              ),
              const SizedBox(
                width: 6,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: textTheme.bodyMedium,
                ),
              ),
              if (text != "support" && text != "settings")
                Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: ImageIcon(
                        AssetImage(Assets.icons.arrowRight.path),
                        size: 14,
                        color: Colors.grey,
                      )),
                )
            ],
          ),
        ),
      ),
    );
  }
}
