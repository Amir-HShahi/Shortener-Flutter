import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/services/http_handler.dart';
import 'package:url_shortener/view/components/customized_text_field.dart';

import '../gen/assets.gen.dart';
import '../view_model/link_view_model.dart';
import 'components/app_bar_widget.dart';
import 'links_screen.dart';

class LinksPage extends StatefulWidget {
  const LinksPage({super.key});

  @override
  State<LinksPage> createState() => _LinksPageState();
}

class _LinksPageState extends State<LinksPage> {
  TextEditingController companyName = TextEditingController();

  TextEditingController companyAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<LinkViewModel>();
    viewModel.updateLinks();
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBarWidget(isHomeButtonActive: true),
      backgroundColor: const Color.fromARGB(240, 246, 246, 249),
      body: SafeArea(
        child: LinksScreen(
          size: size,
          textTheme: textTheme,
        ),
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
                        CustomizedTextField(
                          labelText: "company",
                          controller: companyName,
                        ),
                        CustomizedTextField(
                          labelText: "link",
                          controller: companyAddress,
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
                                        companyAddress.text.isNotEmpty) {
                                      shortenLink(companyName.text,
                                          companyAddress.text);
                                      companyName.clear();
                                      companyAddress.clear();
                                      var viewModel =
                                          context.read<LinkViewModel>();
                                      viewModel.updateLinks();
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
    );
  }
}
