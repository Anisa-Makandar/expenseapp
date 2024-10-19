import 'package:expenseapplication/provider_helper/providerhelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settingthemepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Color(0xFFF6F6F6)
            : Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Color(0xFFF6F6F6),
                      ),
                      onPressed: () {
                        Navigator.pop(
                            context); // Go back to the previous screen
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Settings",
                          style: TextStyle(
                            fontSize: 20,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Color(0xFFF6F6F6),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Switch to Light or Dark mode",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Color(0xFFF6F6F6),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Switch.adaptive(
                          value: context.watch<ThemeProvider>().getThemeVAlue(),
                          onChanged: (value) {
                            context.read<ThemeProvider>().setThemeValue(value);
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
