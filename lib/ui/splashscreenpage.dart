import 'dart:async';

import 'package:expenseapplication/ui/homepage.dart';
import 'package:expenseapplication/ui/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getValuefromPrefs();
    // Timer(Duration(seconds: 4), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => LoginPage()),
    //   );
    // });
  }

  Future<void> getValuefromPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    //fetch uid

    int? uid = prefs.getInt("UID");
    if (uid == null || uid == 0) {
      navigateToLoginPage();
    } else {
      navigateToHomePage();
    }
  }

  void navigateToLoginPage() {
    Timer(Duration(minutes: 15), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  void navigateToHomePage() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xFFF6F6F6),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Color(0xFFF6F6F6)
            : Colors.black,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: Container(
                      // width: 300,
                      // height: 350,
                      width:
                          isLandscape ? screenWidth * 0.6 : screenWidth * 0.7,
                      height:
                          isLandscape ? screenHeight * 0.6 : screenHeight * 0.5,
                      child: FittedBox(
                        child: Image.asset(
                          'assets/images/bg_splasscreenimage.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
