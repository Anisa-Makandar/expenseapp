import 'package:expenseapplication/ui/nav_dashoardpage.dart';
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
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        body: _pages[_currentIndex],
        // SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Image.asset(
        //               'assets/images/bg_logoexpenseapp.png',
        //               height: 40,
        //               width: 120,
        //               fit: BoxFit.cover,
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.only(top: 5.0),
        //               child: Icon(
        //                 Icons.search,
        //                 size: 35,
        //               ),
        //             ),
        //           ],
        //         ),
        //         SizedBox(
        //           height: 15,
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Row(
        //               children: [
        //                 CircleAvatar(
        //                   radius: 25,
        //                   backgroundColor: Colors.blueAccent,
        //                   child: ClipOval(
        //                     child: SizedBox(
        //                       width: 40,
        //                       height: 40,
        //                       child: Image.asset(
        //                         'assets/icons/ic_profileicon.png',
        //                         fit: BoxFit.cover,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   width: 8,
        //                 ),
        //                 Column(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text('Morning'),
        //                     Text(
        //                       'Yamamamoto Yukio',
        //                       style: TextStyle(
        //                           fontSize: 12, fontWeight: FontWeight.bold),
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //             Container(
        //               height: 40,
        //               width: 120,
        //               decoration: BoxDecoration(
        //                   color: const Color(0xFFD7DDFF),
        //                   borderRadius: BorderRadius.circular(6)),
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Text(
        //                     'This Month',
        //                     style: TextStyle(
        //                         fontSize: 14, fontWeight: FontWeight.w700),
        //                   ),
        //                   SizedBox(
        //                     width: 5,
        //                   ),
        //                   Icon(Icons.arrow_drop_down),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //         SizedBox(
        //           height: 25,
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(4.0),
        //           child: Container(
        //             width: double.infinity,
        //             height: 150,
        //             decoration: BoxDecoration(
        //               color: const Color(0xFF6574D3),
        //               borderRadius: BorderRadius.circular(15),
        //             ),
        //             child: Row(
        //               children: [
        //                 Padding(
        //                   padding: const EdgeInsets.symmetric(vertical: 15.0),
        //                   child: Padding(
        //                     padding: const EdgeInsets.only(left: 10.0),
        //                     child: Column(
        //                       mainAxisAlignment: MainAxisAlignment.center,
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         Text(
        //                           'Expense Total',
        //                           style: TextStyle(
        //                               fontSize: 16,
        //                               fontWeight: FontWeight.w700,
        //                               color: Colors.white),
        //                         ),
        //                         SizedBox(
        //                           height: 5,
        //                         ),
        //                         Text(
        //                           '\$3734',
        //                           style: TextStyle(
        //                               fontSize: 30,
        //                               fontWeight: FontWeight.w700,
        //                               color: Colors.white),
        //                         ),
        //                         SizedBox(
        //                           height: 5,
        //                         ),
        //                         Row(
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           children: [
        //                             Container(
        //                               height: 20,
        //                               width: 40,
        //                               decoration: BoxDecoration(
        //                                   borderRadius:
        //                                       BorderRadius.circular(3),
        //                                   color: Colors.red),
        //                               child: Center(
        //                                 child: Text(
        //                                   '\+\$240',
        //                                   style: TextStyle(
        //                                       fontSize: 10,
        //                                       color: Colors.white),
        //                                 ),
        //                               ),
        //                             ),
        //                             SizedBox(
        //                               width: 5,
        //                             ),
        //                             Center(
        //                               child: Text(
        //                                 'than last month',
        //                                 style: TextStyle(color: Colors.white),
        //                                 textAlign: TextAlign.center,
        //                               ),
        //                             )
        //                           ],
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //                 Container(
        //                   child: Image.asset(
        //                     'assets/icons/ic_dashboardicon.png',
        //                     width: 160,
        //                     fit: BoxFit.cover,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10),
        //           child: Text(
        //             'Expense List',
        //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(6.0),
        //           child: Container(
        //             height: 180,
        //             width: double.infinity,
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(12),
        //               border: Border.all(color: const Color(0xFFB9D1FF)),
        //             ),
        //             child: Padding(
        //               padding: const EdgeInsets.symmetric(
        //                   horizontal: 15.0, vertical: 10),
        //               child: Column(
        //                 children: [
        //                   Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Text(
        //                         'Tuesday , 14',
        //                         style: TextStyle(
        //                           fontSize: 16,
        //                           fontWeight: FontWeight.bold,
        //                         ),
        //                       ),
        //                       Text(
        //                         '-\$1380',
        //                         style: TextStyle(
        //                           fontSize: 16,
        //                           fontWeight: FontWeight.bold,
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                   SizedBox(
        //                     height: 20,
        //                   ),
        //                   Padding(
        //                     padding:
        //                         const EdgeInsets.symmetric(horizontal: 10.0),
        //                     child: Divider(
        //                       color: const Color(0xFFB9D1FF),
        //                       thickness: 1,
        //                     ),
        //                   ),
        //                   Column(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Row(
        //                         mainAxisAlignment:
        //                             MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           Row(
        //                             children: [
        //                               Container(
        //                                 height: 40,
        //                                 width: 35,
        //                                 decoration: BoxDecoration(
        //                                   borderRadius:
        //                                       BorderRadius.circular(3),
        //                                   color: const Color(0xFFCED6FF),
        //                                 ),
        //                                 child: Icon(
        //                                   Icons.shopping_basket,
        //                                   color: const Color(0xFF7783D6),
        //                                 ),
        //                               ),
        //                               SizedBox(
        //                                 width: 10,
        //                               ),
        //                               Column(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.center,
        //                                 crossAxisAlignment:
        //                                     CrossAxisAlignment.start,
        //                                 children: [
        //                                   Text('Shop',
        //                                       style: TextStyle(
        //                                         fontSize: 14,
        //                                         fontWeight: FontWeight.bold,
        //                                       )),
        //                                   Text(
        //                                     'Buy new clothes',
        //                                     style: TextStyle(
        //                                       fontSize: 12,
        //                                     ),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ],
        //                           ),
        //                           Text('-\$90',
        //                               style: TextStyle(
        //                                   fontSize: 14,
        //                                   fontWeight: FontWeight.bold,
        //                                   color: const Color(
        //                                       0xFFF0A7D2))), // Display amount here
        //                         ],
        //                       ),
        //                     ],
        //                   ),
        //                   SizedBox(
        //                     height: 15,
        //                   ),
        //                   Column(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Row(
        //                         mainAxisAlignment:
        //                             MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           Row(
        //                             children: [
        //                               Container(
        //                                 height: 40,
        //                                 width: 35,
        //                                 decoration: BoxDecoration(
        //                                   borderRadius:
        //                                       BorderRadius.circular(3),
        //                                   color: const Color(0xFFFDDEBC),
        //                                 ),
        //                                 child: Icon(
        //                                   Icons.mobile_friendly,
        //                                   color: const Color(0xFFFFD391),
        //                                 ),
        //                               ),
        //                               SizedBox(
        //                                 width: 10,
        //                               ),
        //                               Column(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.center,
        //                                 crossAxisAlignment:
        //                                     CrossAxisAlignment.start,
        //                                 children: [
        //                                   Text('Electronic',
        //                                       style: TextStyle(
        //                                         fontSize: 14,
        //                                         fontWeight: FontWeight.bold,
        //                                       )),
        //                                   Text(
        //                                     'Buy new iPjone 11',
        //                                     style: TextStyle(
        //                                       fontSize: 12,
        //                                     ),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ],
        //                           ),
        //                           Text('-\$1290',
        //                               style: TextStyle(
        //                                   fontSize: 14,
        //                                   fontWeight: FontWeight.bold,
        //                                   color: const Color(
        //                                       0xFFF0A7D2))), // Display amount here
        //                         ],
        //                       ),
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           height: 10,
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(6.0),
        //           child: Container(
        //             height: 150,
        //             width: double.infinity,
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(12),
        //               border: Border.all(color: const Color(0xFFB9D1FF)),
        //             ),
        //             child: Padding(
        //               padding: const EdgeInsets.symmetric(
        //                   horizontal: 15.0, vertical: 10),
        //               child: Column(
        //                 children: [
        //                   Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Text(
        //                         'Monday , 13',
        //                         style: TextStyle(
        //                           fontSize: 16,
        //                           fontWeight: FontWeight.bold,
        //                         ),
        //                       ),
        //                       Text(
        //                         '-\$60',
        //                         style: TextStyle(
        //                           fontSize: 16,
        //                           fontWeight: FontWeight.bold,
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                   SizedBox(
        //                     height: 10,
        //                   ),
        //                   Padding(
        //                     padding:
        //                         const EdgeInsets.symmetric(horizontal: 10.0),
        //                     child: Divider(
        //                       color: const Color(0xFFB9D1FF),
        //                       thickness: 1,
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     height: 10,
        //                   ),
        //                   Column(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Row(
        //                         mainAxisAlignment:
        //                             MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           Row(
        //                             children: [
        //                               Container(
        //                                 height: 40,
        //                                 width: 35,
        //                                 decoration: BoxDecoration(
        //                                   borderRadius:
        //                                       BorderRadius.circular(3),
        //                                   color: const Color(0xFFFAE6E7),
        //                                 ),
        //                                 child: Icon(
        //                                   Icons.car_rental_rounded,
        //                                   color: const Color(0xFFE89E9D),
        //                                 ),
        //                               ),
        //                               SizedBox(
        //                                 width: 10,
        //                               ),
        //                               Column(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.center,
        //                                 crossAxisAlignment:
        //                                     CrossAxisAlignment.start,
        //                                 children: [
        //                                   Text('Transportation',
        //                                       style: TextStyle(
        //                                         fontSize: 14,
        //                                         fontWeight: FontWeight.bold,
        //                                       )),
        //                                   Text(
        //                                     'Trip to malang',
        //                                     style: TextStyle(
        //                                       fontSize: 12,
        //                                     ),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ],
        //                           ),
        //                           Text('-\$60',
        //                               style: TextStyle(
        //                                   fontSize: 14,
        //                                   fontWeight: FontWeight.bold,
        //                                   color: const Color(
        //                                       0xFFF0A7D2))), // Display amount here
        //                         ],
        //                       ),
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
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
            //  _pages[_currentIndex], // Show the selected page
          ],
        ),
      ),
    );
  }
}
