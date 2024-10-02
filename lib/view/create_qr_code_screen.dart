import 'package:flutter/material.dart';
import 'package:url_shortener/view/components/customized_floating_button.dart';
import 'package:url_shortener/view/components/customized_text_field.dart';

import '../utility.dart';
import 'components/app_bar_widget.dart';

class CreateQrCodeScreen extends StatelessWidget {
  const CreateQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void saveQrCodeHandler() {}

    TextEditingController companyName = TextEditingController();
    TextEditingController companyAddress = TextEditingController();

    return Scaffold(
      appBar: AppBarWidget(isHomeButtonActive: true),
      backgroundColor: const Color(0xfff8f9fa),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomizedFloatingButton(
          buttonIcon: Icons.check, title: "save", onTap: saveQrCodeHandler),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(scaledWidth(16)),
        child: Column(
          children: [
            CustomizedTextField(labelText: "Name", controller: companyName),
            CustomizedTextField(
                labelText: "Address", controller: companyAddress)
          ],
        ),
      )),
    );
  }
}
