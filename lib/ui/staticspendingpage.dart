import 'package:expenseapplication/bloc_helper/expense_bloc.dart';
import 'package:expenseapplication/bloc_helper/expense_event.dart';
import 'package:expenseapplication/bloc_helper/expense_state.dart';
import 'package:expenseapplication/database/dbhelper.dart';
import 'package:expenseapplication/models/expensemodel.dart';
import 'package:expenseapplication/models/filter_expense_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class StaticDetails extends StatefulWidget {
  @override
  State<StaticDetails> createState() => _StaticDetailsState();
}

class _StaticDetailsState extends State<StaticDetails> {
  MediaQueryData? mediaQueryData;
  DBHelper dbHelper = DBHelper.getinstance();
  List<FilterExpenseModel> mFilterData = [];
  bool isLandscape = false;
  List<DateFormat> mformat = [
    DateFormat.yMMMEd(),
    DateFormat.MMMEd(),
    DateFormat.y(),
  ];
  String selectedFilter = "This Week";
  int initialSelectedValue = 0;
  List<String> filterMenu = [
    "This Week ",
    "This Month",
    "This Year",
  ];

  final List<Map<String, dynamic>> Carddata = [
    {
      'name': 'Shop',
      'price': '-\$1190',
      'icon': Icon(
        Icons.shopping_basket,
        color: const Color(0xFF7783D6),
      ),
      'containerclr': const Color(0xFFCED6FF), // Store Color directly
    },
    {
      'name': 'Transportation',
      'price': '-\$890',
      'icon': Icon(
        Icons.car_rental_rounded,
        color: const Color(0xFFE89E9D),
      ),
      'containerclr': const Color(0xFFFAE6E7),
    },
    {
      'name': 'Transportation',
      'price': '-\$890',
      'icon': Icon(
        Icons.car_rental_rounded,
        color: const Color(0xFFE89E9D),
      ),
      'containerclr': const Color(0xFFFAE6E7),
    },
  ];

  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(GetInitialExpensesEvent());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    isLandscape = mediaQueryData!.orientation == Orientation.landscape;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xFFF6F6F6),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Color(0xFFF6F6F6)
            : Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: isLandscape
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: getInitialUI()),
                    Expanded(
                        child: SingleChildScrollView(
                            child: getExpenseBreakdownUI())),
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // UI Part 1
                      getInitialUI(),

                      // UI Part 2
                      getExpenseBreakdownUI(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget getInitialUI() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Statistic',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    color: const Color(0xFFD7DDFF),
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'This Month',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: double.infinity,
            height: isLandscape ? mediaQueryData!.size.height * 0.25 : 150,
            decoration: BoxDecoration(
              color: const Color(0xFF6574D3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total expense',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 120,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFF8490DC),
                              borderRadius: BorderRadius.circular(25),
                              // shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: '\$3734',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' / \$4000 per month',
                                    style: TextStyle(
                                        color: const Color(0xFFAAB1E5),
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 300,
                            // width: double.infinity,
                            height: 10,
                            decoration: BoxDecoration(
                              color: const Color(0xFF5867BC),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              width: 240,
                              // width: double.infinity,
                              height: 10,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEBC68F),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getExpenseBreakdownUI() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Expense Breakdown',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFFD7DDFF), // Background color
                  borderRadius: BorderRadius.circular(6), // Rounded corners
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownMenu(
                      inputDecorationTheme: InputDecorationTheme(
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(21),
                          //   borderSide: const BorderSide(width: 1),
                          // ),
                          ),
                      initialSelection:
                          filterMenu[0], // Initial selected menu item
                      width: 100,
                      onSelected: (value) {
                        selectedFilter = value!;
                        setState(() {
                          if (value == filterMenu[0]) {
                            initialSelectedValue = 0;
                          } else if (value == filterMenu[1]) {
                            initialSelectedValue = 1;
                          } else if (value == filterMenu[2]) {
                            initialSelectedValue = 2;
                          }
                        });
                      },
                      dropdownMenuEntries: filterMenu
                          .map((element) =>
                              DropdownMenuEntry(value: element, label: element))
                          .toList(),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    // const Icon(Icons
                    //     .arrow_drop_down), // Add dropdown arrow icon
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 300,
          child: BlocBuilder<ExpenseBloc, ExpenseState>(builder: (c, State) {
            if (State is ExpenseLoadingState) {
              return CircularProgressIndicator();
            }
            if (State is ExpenseLoadedState) {
              filterExpensesDateWise(State.mData);
              var alldata = State.mData;
              if (alldata.isNotEmpty) {
                List<BarChartGroupData> mbars = [];
                for (int i = 0; i < mFilterData.length; i++) {
                  mbars.add(BarChartGroupData(x: i, barRods: [
                    BarChartRodData(
                      toY: double.parse(mFilterData[i]
                          .totalAmt
                          .toDouble()
                          .toStringAsFixed(2)),
                      width: 15,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(2),
                          topRight: Radius.circular(2)),
                    )
                  ]));
                }
                return BarChart(BarChartData(
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (_) => Colors.amberAccent,
                      tooltipMargin: -10,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        String toolTipName = mFilterData[group.x].title;
                        return BarTooltipItem(
                          toolTipName,
                          TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            space: 16,
                            child: Text(
                                (mFilterData[value.toInt()].title.toString())),
                          );
                        },
                        reservedSize: 35,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                              axisSide: meta.axisSide,
                              space: 1,
                              child: Text(
                                value.toString(),
                                style: TextStyle(fontSize: 10),
                              ));
                        },
                        reservedSize: 40,
                      ),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  barGroups: mbars,
                ));
              } else {
                return Center(
                  child: Text("no expense yet"),
                );
              }
            }
            return Container();
          }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Spending Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Your expenses are devided into 6 categories',
                    style:
                        TextStyle(fontSize: 14, color: const Color(0xFF9396A9)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 318,
                        // width: double.infinity,
                        height: 10,
                        decoration: BoxDecoration(
                          color: const Color(0xFF65DA94),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          width: 280,
                          // width: double.infinity,
                          height: 10,
                          decoration: BoxDecoration(
                            color: const Color(0xFFDA6565),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          width: 260,
                          // width: double.infinity,
                          height: 10,
                          decoration: BoxDecoration(
                            color: const Color(0xFF66C2DB),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          width: 200,
                          // width: double.infinity,
                          height: 10,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEBC68F),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          width: 160,
                          // width: double.infinity,
                          height: 10,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE78BBC),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          width: 80,
                          // width: double.infinity,
                          height: 10,
                          decoration: BoxDecoration(
                            color: const Color(0xFF6574D2),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: SizedBox(
            height: 400, // Provide a fixed height
            child: GridView.builder(
              itemCount: Carddata.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFB9D1FF)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Carddata[index]['containerclr'],
                            ),
                            child: Carddata[index]['icon'],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Carddata[index]['name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  Carddata[index]['price'],
                                  style: TextStyle(
                                      color: const Color(0xFFF0A7D2),
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 11,
                crossAxisSpacing: 11,
                childAspectRatio: 3 / 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void filterExpensesDateWise(List<expenseModel> allExp) {
    mFilterData.clear();
    List<String> uniqueDates = [];
    for (expenseModel eachExp in allExp) {
      String formattedDate = mformat[initialSelectedValue].format(
          DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.expense_date)));
      if (!uniqueDates.contains(formattedDate)) {
        uniqueDates.add(formattedDate);
        for (String eachDate in uniqueDates) {
          List<expenseModel> eachDayexp = [];
          num totalAmt = 0.0;
          for (expenseModel eachExp in allExp) {
            String eachExpDate = mformat[initialSelectedValue].format(
                DateTime.fromMillisecondsSinceEpoch(
                    int.parse(eachExp.expense_date)));
            if (eachExpDate == eachExpDate) {
              eachDayexp.add(eachExp);
              if (eachExp.expense_type == "Debit") {
                totalAmt += eachExp.expense_amt;
              } else {
                totalAmt -= eachExp.expense_amt;
              }
            }
            //print(" this is ${uniqueDates.length}");
          }

          mFilterData.add(FilterExpenseModel(
              title: eachDate,
              totalAmt: totalAmt.round(),
              mExpenses: eachDayexp));
        }
      }
    }
  }
}
