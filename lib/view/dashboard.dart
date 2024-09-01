import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_shortener/gen/assets.gen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(240, 246, 246, 249),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: size.width,
              height: size.height / 4.39,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "2/10 links available",
                          style: textTheme.titleMedium,
                        ),
                        InkWell(
                            onTap: () {},
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
                    const SizedBox(height: 12,),
                    LinearProgressIndicator(
                      value: 0.7,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(226, 27, 72, 218)),
                      borderRadius: const BorderRadius.all( Radius.circular(6)),
                      minHeight: 8,
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      children: [
                        Text(
                          "Upgrade now",
                          style: textTheme.bodySmall,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        InkWell(
                            onTap: () {},
                            child: const Icon(CupertinoIcons.arrow_right,
                                color: Color.fromARGB(226, 27, 72, 218),
                                size: 20))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height / 11.83,
              color: const Color.fromARGB(240, 246, 246, 249),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(Assets.images.avatar.path,
                        fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "John Doe",
                              style: textTheme.headlineMedium,
                            ),
                            Text(
                              "Free account",
                              style: textTheme.headlineSmall,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                      width: 70,
                      child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              const Color.fromARGB(155, 26, 205, 129)
                            ),
                            shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4))
                            ))
                          ),
                          child: Text(
                            "Upgrade",
                            style: textTheme.labelSmall,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
