import 'package:expenseapplication/bloc_helper/expense_bloc.dart';
import 'package:expenseapplication/bloc_helper/expense_event.dart';
import 'package:expenseapplication/domain/app_constants.dart';
import 'package:expenseapplication/domain/ui_helper.dart';
import 'package:expenseapplication/models/expensemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddExpensePage extends StatefulWidget {
  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  MediaQueryData? mediaQueryData;
  bool isLandscape = false;
  TextEditingController titlecontroller = TextEditingController();

  TextEditingController desccontroller = TextEditingController();

  TextEditingController amtcontroller = TextEditingController();

  int selectedCatindex = -1;
  DateTime? selectedDate;
  DateFormat dtFormat = DateFormat.yMMMEd();
  List<String> mExpenseType = [
    "Debit",
    "Credit",
    "Loan",
    "Lend",
    "Borrow"
  ]; // lend means udhar dena and borrow udhar lena

  String SelectedExpenseType = "Debit";

  @override
  Widget build(BuildContext context) {
    // if (selectedCatindex >= 0) {
    //   titlecontroller.text = AppConstants.mCat[selectedCatindex].catName;
    // }
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xFFF6F6F6),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Color(0xFFF6F6F6)
            : Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              children: [
                TextField(
                  controller: titlecontroller,
                  decoration: mTextFieldDecor(
                      hintText: "Enter your expense title here ",
                      labelText: "Title",
                      context: context),
                ),
                mSpacer(),
                TextField(
                  controller: desccontroller,
                  decoration: mTextFieldDecor(
                      hintText: "Enter your expense description here",
                      labelText: "Desc",
                      context: context),
                ),
                mSpacer(),
                TextField(
                  controller: amtcontroller,
                  decoration: mTextFieldDecor(
                      hintText: "Enter your expense ammount here",
                      labelText: "Amount",
                      context: context),
                ),
                mSpacer(),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          width: 1,
                          color: Theme.of(context).brightness ==
                                  Brightness.light
                              ? Colors.black // Dark border color in light mode
                              : Color(0xFFF6F6F6),
                        ),
                        minimumSize: Size(double.infinity, 52),
                        maximumSize: Size(double.infinity, 52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                        )),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return Container(
                              padding: EdgeInsets.all(11),
                              child: GridView.builder(
                                  itemCount: AppConstants.mCat.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4),
                                  itemBuilder: (_, index) {
                                    return InkWell(
                                      onTap: () {
                                        selectedCatindex = index;
                                        setState(() {});
                                        Navigator.pop(context);
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            AppConstants.mCat[index].catImg,
                                            width: 50,
                                            height: 50,
                                          ),
                                          Text(
                                              AppConstants.mCat[index].catName),
                                        ],
                                      ),
                                    );
                                  }),
                            );
                          });
                    },
                    child: selectedCatindex >= 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppConstants.mCat[selectedCatindex].catImg,
                                width: 40,
                                height: 40,
                              ),
                              mSpacer(),
                              Text(AppConstants.mCat[selectedCatindex].catName),
                            ],
                          )
                        : Text("Choose a category"),
                  ),
                ),
                mSpacer(),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          width: 1,
                          color: Theme.of(context).brightness ==
                                  Brightness.light
                              ? Colors.black // Dark border color in light mode
                              : Color(0xFFF6F6F6),
                        ),
                        minimumSize: Size(double.infinity, 52),
                        maximumSize: Size(double.infinity, 52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                        )),
                    onPressed: () async {
                      selectedDate = await showDatePicker(
                          context: context,
                          firstDate:
                              DateTime.now().subtract(Duration(days: 731)),
                          lastDate: DateTime.now());

                      setState(() {});
                    },
                    child: Text(
                      dtFormat.format((selectedDate ?? DateTime.now())),
                    ),
                  ),
                ),
                // mSpacer(),
                // SizedBox(
                //   child: DropdownButton(
                //     value: SelectedExpenseType,
                //     items: mExpenseType
                //         .map((element) => DropdownMenuItem(
                //             value: element, child: Text(element)))
                //         .toList(),
                //     onChanged: (value) {
                //       SelectedExpenseType = value!;
                //       setState(() {});
                //     },
                //   ),
                // ),
                /////////////////////////////// OR///////////////////////////////////
                // niche wale dropdownmenu me setstate () kp handle karne ki jarurat nhi he ye apne aap hi handle karra he
                mSpacer(),
                DropdownMenu(
                  inputDecorationTheme: InputDecorationTheme(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black // Dark border color in light mode
                            : Color(0xFFF6F6F6),
                      ),
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width -
                      30, // -30 i ntg but padding minus kiya he both left and right ki
                  label: Text("Type"),
                  onSelected: (value) {
                    SelectedExpenseType = value!;
                  },
                  initialSelection: SelectedExpenseType,
                  dropdownMenuEntries: mExpenseType
                      .map((element) =>
                          DropdownMenuEntry(value: element, label: element))
                      .toList(),
                ),
                mSpacer(),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            width: 1,
                            color: Theme.of(context).brightness ==
                                    Brightness.light
                                ? Colors
                                    .black // Dark border color in light mode
                                : Color(0xFFF6F6F6),
                          ),
                          minimumSize: Size(double.infinity, 52),
                          maximumSize: Size(double.infinity, 52),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(21),
                          )),
                      onPressed: () {
                        if (selectedCatindex >= 0 &&
                            titlecontroller.text.isNotEmpty &&
                            desccontroller.text.isNotEmpty &&
                            amtcontroller.text.isNotEmpty) {
                          context.read<ExpenseBloc>().add(AddExpensesEvent(
                              newExpenses: expenseModel(
                                  expense_amt: double.parse(
                                      amtcontroller.text.toString()),
                                  expense_date: (selectedDate ?? DateTime.now())
                                      .millisecondsSinceEpoch
                                      .toString(),
                                  expense_bal: 0,
                                  expense_title:
                                      titlecontroller.text.toString(),
                                  expense_desc: desccontroller.text.toString(),
                                  expense_type: SelectedExpenseType,
                                  expense_cat_id: AppConstants
                                      .mCat[selectedCatindex].catId)));
                        }
                      },
                      child: Text("Add Expense")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
