import 'package:flutter/material.dart';

Widget mSpacer({
  double mWidth = 11,
  double mHeight = 11,
}) =>
    SizedBox(
      width: mWidth,
      height: mHeight,
    );

InputDecoration mTextFieldDecor(
    {required String hintText,
    required String labelText,
    double borderRadius = 21}) {
  return InputDecoration(
    hintText: hintText,
    label: Text(labelText),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
  );
}
