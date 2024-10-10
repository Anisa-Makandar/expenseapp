import 'package:expenseapplication/ui/addexpensepage.dart';
import 'package:expenseapplication/ui/dashboardpage.dart';
import 'package:expenseapplication/ui/staticspendingpage.dart';
import 'package:flutter/material.dart';

class Dashboardpage extends StatefulWidget {
  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
  int _currentIndex = 0; // Track the selected index

  // List of pages to navigate to
  final List<Widget> _pages = [
    NavDashboard(),
    StaticDetails(),
    AddExpensePage(),
    AddExpensePage(),
    AddExpensePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              // padding: const EdgeInsets.only(left: 5, right: 7, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/bg_logoexpenseapp.png',
                    height: 40,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Icon(
                      Icons.search,
                      size: 35,
                    ),
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
}
