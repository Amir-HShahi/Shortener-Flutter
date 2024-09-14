import 'package:flutter/material.dart';

class ShortenerDivider extends StatelessWidget {
  const ShortenerDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: Colors.grey.withOpacity(0.3),
    );
  }
}
