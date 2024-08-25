import 'package:flutter/material.dart';

Size? screenData;

void initializeScreenData(BuildContext context) {
  screenData = MediaQuery.of(context).size;
}

double scaledHeight(double height) {
  if (screenData != null) {
    return (screenData!.height / 852) * height;
  }
  return height;
}

double scaledWidth(double width) {
  if (screenData != null) {
    return (screenData!.width / 393) * width;
  }
  return width;
}
