import 'package:expenseapplication/database/dbhelper.dart';
import 'package:expenseapplication/models/userexpensemodel.dart';
import 'package:expenseapplication/ui/loginpage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController mobilecontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final TextEditingController repasscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    bool isLandscape = mediaQueryData.orientation == Orientation.landscape;

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
                    Expanded(child: Center(child: getRegisterationUI())),
                    Expanded(
                        child: SingleChildScrollView(
                            child: getRegistrationInfoUI(context))),
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // UI Part 1
                      getRegisterationUI(),

                      // UI Part 2
                      getRegistrationInfoUI(context),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget getRegisterationUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 10),
          child: Center(
            child: Container(
              width: 200,
              height: 150,
              // width: MediaQuery.of(context).size.width * 0.5,
              // height: MediaQuery.of(context).size.height * 0.4,
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

  Widget getRegistrationInfoUI(BuildContext context) {
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
                  padding: const EdgeInsets.all(15.0),
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
                // Mobile Number Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Mobile Number',
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
                    controller: mobilecontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter Mobile Number',
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
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Re-Password',
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
                    controller: repasscontroller,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: 'Re-Enter Password',
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
                SizedBox(height: 15),
                // Add more fields as needed
              ],
            ),
          ),
        ),
        SizedBox(
          height: 12,
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

                    // Add the new user
                    bool check = await db.addNewUser(UserModel(
                      user_id: 0,
                      uemail: emailcontroller.text.toString(),
                      umobileno: mobilecontroller.text.toString(),
                      upassword: passcontroller.text.toString(),
                      urepassword: repasscontroller.text.toString(),
                    ));
                    if (check) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Email Already Registerd !'),
                        action: SnackBarAction(
                            label: "Sign In Now",
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            }),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Sign Up',
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
                  text: 'Already have an account ? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'primaryFont',
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign In',
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
                                builder: (context) => LoginPage()),
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
