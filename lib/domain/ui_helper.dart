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
    required BuildContext context, // Add BuildContext as a parameter

    double borderRadius = 21}) {
  return InputDecoration(
    hintText: hintText,
    label: Text(labelText),
    hintStyle: TextStyle(
      color: Theme.of(context).brightness == Brightness.light
          ? Colors.black // Dark color in light mode
          : Color(0xFFF6F6F6),
    ),
    labelStyle: TextStyle(
      color: Theme.of(context).brightness == Brightness.light
          ? Colors.black // Dark color in light mode
          : Color(0xFFF6F6F6),
    ),
    // fillColor: Theme.of(context).brightness == Brightness.light
    //     ? Colors.black // Dark color in light mode
    //     : Color(0xFFF6F6F6),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.black // Dark border color in light mode
            : Color(0xFFF6F6F6), // Light border color in dark mode
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.black // Dark border color in light mode
            : Color(0xFFF6F6F6), // Light border color in dark mode
      ),
    ),
  );
}
