import 'package:expenseapplication/ui/addexpensepage.dart';
import 'package:expenseapplication/ui/dashboardpage.dart';
import 'package:expenseapplication/ui/settingthemepage.dart';
import 'package:expenseapplication/ui/staticspendingpage.dart';
import 'package:flutter/material.dart';

class Dashboardpage extends StatefulWidget {
  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
  int _currentIndex = 0;
  bool isDarkTheme = false;

  // List of pages to navigate to
  final List<Widget> _pages = [
    NavDashboard(),
    StaticDetails(),
    AddExpensePage(),
    AddExpensePage(),
    AddExpensePage(),
    Settingthemepage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xFFF6F6F6),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Color(0xFFF6F6F6)
            : Colors.black,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 1, left: 1, right: 1),
              // padding: const EdgeInsets.only(left: 5, right: 7, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/bg_logoexpenseapp.png',
                    height: 34,
                    width: 120,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    fit: BoxFit.cover,
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: PopupMenuButton(
                              icon: Icon(Icons.more_vert, size: 26),
                              onSelected: (item) => onSelected(context, item),
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                      value: 0,
                                      child: Row(
                                        children: [
                                          Icon(Icons.settings,
                                              color: Colors.black),
                                          SizedBox(width: 8),
                                          Text('Settings'),
                                        ],
                                      ),
                                    ),
                                  ])),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Icon(
                          Icons.search,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: _pages[_currentIndex]),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFFF6F6F6),
          currentIndex: _currentIndex, // Set the current index
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Update the current index
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
                color: _currentIndex == 0
                    ? Color(0xFFE792BF)
                    : Colors.grey, // Change color when selected
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.graphic_eq_outlined,
                size: 25,
                color: _currentIndex == 1
                    ? Color(0xFFE792BF)
                    : Colors.grey, // Change color when selected
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFE792BF),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notification_add,
                size: 25,
                color: _currentIndex == 3
                    ? Color(0xFFE792BF)
                    : Colors.grey, // Change color when selected
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 25,
                color: _currentIndex == 4
                    ? Color(0xFFE792BF)
                    : Colors.grey, // Change color when selected
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  // Widget getSettingToggleUI(BuildContext context) {
  //   return Container(
  //     height: 39,
  //     width: 120,
  //     decoration: BoxDecoration(
  //       // Set background color based on theme
  //       color: Theme.of(context).brightness == Brightness.light
  //           ? Color(0xFFD7DDFF)
  //           : Colors.black,
  //       borderRadius: BorderRadius.circular(6), // Rounded corners
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.all(2.0),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(
  //             "Setting",
  //             style: TextStyle(
  //               color: Theme.of(context).brightness == Brightness.light
  //                   ? Colors.black
  //                   : Color(0xFFF6F6F6),
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           SizedBox(width: 8), // Space between text and icon
  //           Icon(
  //             Icons.settings,
  //             color: Theme.of(context).brightness == Brightness.light
  //                 ? Colors.black
  //                 : Color(0xFFF6F6F6),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Settingthemepage()),
        );
        break;
    }
  }
}
