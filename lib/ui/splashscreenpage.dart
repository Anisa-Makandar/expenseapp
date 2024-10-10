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
    Timer(Duration(seconds: 4), () {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(
                child: Container(
                  width: 300,
                  height: 350,
                  child: Image.asset(
                    'assets/images/bg_splasscreenimage.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
