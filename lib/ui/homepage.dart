import 'package:expenseapplication/ui/bottom_navpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final isLandscape = mediaQueryData.orientation == Orientation.landscape;
    final maxWidth = mediaQueryData.size.width;
    final maxHeight = mediaQueryData.size.height;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xFFF6F6F6),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Color(0xFFF6F6F6)
            : Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
          child: Column(
            children: [
              Center(
                child: Container(
                  child: Image.asset(
                    'assets/images/bg_logoexpenseapp.png',
                    height: 40,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              isLandscape
                  ? Row(
                      children: [
                        Expanded(
                            child: getHomePageUI(
                                maxWidth, maxHeight, isLandscape)),
                        Expanded(
                            child: getHomeUI(
                                context, maxWidth, maxHeight, isLandscape)),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      verticalDirection: VerticalDirection.down,
                      children: [
                        FittedBox(
                            child: getHomePageUI(
                                maxWidth, maxHeight, isLandscape)),
                        getHomeUI(context, maxWidth, maxHeight, isLandscape),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getHomePageUI(double maxWidth, double maxHeight, bool isLandscape) {
    double containerHeight;
    double containerWidth;

    // If landscape, use relative dimensions (based on max height and width)
    if (isLandscape) {
      containerHeight = maxHeight * 0.7;
      containerWidth = maxWidth * 0.3;
    }
    // If portrait, set fixed dimensions
    else {
      containerHeight = maxHeight * 0.4; // fixed height for portrait
      containerWidth = maxWidth * 0.8; // fixed width for portrait
    }

    return Column(
      children: [
        Center(
          child: Container(
            child: Image.asset(
              'assets/images/bg_homepageimage.png',
              // width: maxWidth * 0.3,
              // height: maxHeight * 0.6,
              width: containerWidth,
              height: containerHeight,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget getHomeUI(BuildContext context, double maxWidth, double maxHeight,
      bool isLandscape) {
    double containerHeight;
    double containerWidth;

    // If landscape, use relative dimensions (based on max height and width)
    if (isLandscape) {
      containerHeight = maxHeight * 0.09;
      containerWidth = maxWidth * 0.06;
    }
    // If portrait, set fixed dimensions
    else {
      containerHeight = maxHeight * 0.05; // fixed height for portrait
      containerWidth = maxWidth * 0.13; // fixed width for portrait
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      verticalDirection: VerticalDirection.down,
      children: [
        SizedBox(
          height: 30,
        ),
        Center(
          child: Text(
            "Easy way to monitor your expense",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            "Safe your future by managing your expense right now",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF9F9FAC)),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to Dashboard page when tapped
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboardpage()),
                );
              },
              child: Container(
                height: containerHeight, // Dynamic height based on orientation
                width: containerWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFE989BD),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
