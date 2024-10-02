import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/view/components/customized_floating_button.dart';
import 'package:url_shortener/view/components/customized_text_field.dart';
import 'package:url_shortener/view_model/qr_code_view_model.dart';

import '../utility.dart';
import 'components/app_bar_widget.dart';

class CreateQrCodeScreen extends StatelessWidget {
  const CreateQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController companyName = TextEditingController();
    TextEditingController companyAddress = TextEditingController();

    void saveQrCodeHandler() {
      if (companyName.text.isNotEmpty && companyAddress.text.isNotEmpty) {
        var viewModel = context.read<QrCodeViewModel>();
        viewModel.addQrCode(companyName.text, companyAddress.text);
        Navigator.pop(context);
      } else {
        var textTheme = Theme.of(context).textTheme;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Name or address can't be empty",
          style: textTheme.displayMedium,
        )));
      }
    }

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
