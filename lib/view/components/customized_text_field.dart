import 'package:flutter/material.dart';

class CustomizedTextField extends StatelessWidget {
  const CustomizedTextField({
    super.key,
    required this.labelText,
    required this.controller,
  });

  final String labelText;
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
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
