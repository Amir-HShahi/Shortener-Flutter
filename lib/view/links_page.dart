import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../model/data_models.dart';
import '../model/list_data.dart';
import 'components/app_bar_widget.dart';
import 'links_screen.dart';

// ignore: must_be_immutable
class LinksPage extends StatefulWidget {
  const LinksPage({super.key});

  @override
  State<LinksPage> createState() => _LinksPageState();
}

class _LinksPageState extends State<LinksPage> {
  TextEditingController companyName = TextEditingController();

  TextEditingController companyLink = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
          appBar: AppBarWidget(isHomeButtonActive: true),
          backgroundColor: const Color.fromARGB(240, 246, 246, 249),
          body: LinksScreen(
            size: size,
            textTheme: textTheme,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(226, 27, 72, 218)),
                  shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)))),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: SizedBox(
                        height: size.height / 4,
                        child: Column(
                          children: [
                            BottomSheetTextField(
                              lableText: "company",
                              controller: companyName,
                            ),
                            BottomSheetTextField(
                              lableText: "link",
                              controller: companyLink,
                            ),

                            // button bottom sheet
                            SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor: WidgetStateProperty.all(
                                            const Color.fromARGB(226, 27, 72, 218)),
                                        shape: WidgetStateProperty.all(
                                            const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(6))))),
                                    onPressed: () {
                                      setState(() {
                                        if (companyName.text.isNotEmpty &&
                                            companyLink.text.isNotEmpty) {
                                          linkModel.add(LinkModel(
                                              companyName: companyName.text,
                                              link: companyLink.text));
                                          companyName.clear();
                                          companyLink.clear();
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                              "Text is empty",
                                              style: textTheme.displayMedium,
                                            ),
                                          ));
                                        }
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Text("Create",
                                        style: textTheme.displayMedium)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage(Assets.images.plus.path),
                      color: Colors.white,
                    ),
                    Text(
                      "Create new",
                      style: textTheme.displayMedium,
                    )
                  ],
                )),
          ),
        ));
  }
}

class BottomSheetTextField extends StatelessWidget {
  const BottomSheetTextField({
    super.key,
    required this.lableText,
    required this.controller,
  });

  final String lableText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 12, left: 12),
      child: TextField(
        controller: controller,
        textDirection: TextDirection.ltr,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: const BorderSide(
                width: 2, color: Color.fromARGB(226, 27, 72, 218)),
          ),
          filled: true,
          fillColor: Colors.white,
          labelText: lableText,
          labelStyle: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
