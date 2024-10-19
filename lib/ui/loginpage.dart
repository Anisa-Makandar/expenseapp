import 'package:expenseapplication/database/dbhelper.dart';
import 'package:expenseapplication/ui/homepage.dart';
import 'package:expenseapplication/ui/registrationpage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final isLandscape = mediaQueryData.orientation == Orientation.landscape;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Color(0xFFF6F6F6)
            : Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: isLandscape
              ? Row(
                  children: [
                    Expanded(child: Center(child: getLoginUI())),
                    Expanded(
                        child: SingleChildScrollView(
                            child: getLoginInfoUI(context))),
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // UI Part 1
                      getLoginUI(),

                      // UI Part 2
                      getLoginInfoUI(context),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget getLoginUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 10),
          child: Center(
            child: Container(
              width: 200,
              height: 150,
              child: Center(
                child: Image.asset(
                  'assets/images/bg_loginimg.png',
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getLoginInfoUI(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xC26574D3),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Email Address',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontFamily: 'primaryFont'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter Email I\'d',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: const Color(0x3F000000),
                        fontFamily: 'primaryFont',
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Color(0xFFB6AEFF),
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Color(0xFFB6AEFF),
                          width: 2,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                // Password Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontFamily: 'primaryFont'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: passcontroller,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: const Color(0x3F000000),
                        fontFamily: 'primaryFont',
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Color(0xFFB6AEFF),
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Color(0xFFB6AEFF),
                          width: 2,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              width: 400,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFE58ABB),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton(
                  onPressed: () async {
                    var db = DBHelper.getinstance();
                    var check = await db.authenticateUser(
                        emailcontroller.text.toString(),
                        passcontroller.text.toString());
                    if (check) {
                      var prefs = await SharedPreferences.getInstance();
                      int userId = await db.getUUID();
                      prefs.setInt("UID", userId);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Invalid Credentials !'),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'primaryFont'),
                  )),
            ),
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Don\'t have an account ? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'primaryFont',
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: const Color(0xFF6574D3),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'primaryFont',
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
