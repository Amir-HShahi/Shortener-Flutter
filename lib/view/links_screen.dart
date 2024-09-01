import 'package:flutter/material.dart';
import 'package:url_shortener/gen/assets.gen.dart';
import 'package:url_shortener/model/list_data.dart';
import 'package:url_shortener/view/components/my_component.dart';

class LinksScreen extends StatelessWidget {
  const LinksScreen({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(240, 246, 246, 249),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 0, 16),
                  child: Text(
                    "Links",
                    style: textTheme.titleLarge,
                  ),
                ),
                const ShortenerDivider(),
                LinkList(size: size, textTheme: textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LinkList extends StatelessWidget {
  const LinkList({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: size.height / 1.4, minHeight: size.height / 9.63),
      child: linkModel.isEmpty
          ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("empty",style: textTheme.headlineSmall,),
            ],
          )
          : ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: linkModel.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                linkModel[index].companyName,
                                style: textTheme.titleSmall,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                linkModel[index].link,
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(Assets.images.chart.path),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "53 clicks",
                                style: textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (index != linkModel.length - 1)
                      (const ShortenerDivider()),
                  ],
                );
              },
            ),
    );
  }
}
