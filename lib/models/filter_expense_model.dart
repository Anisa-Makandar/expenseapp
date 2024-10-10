import 'package:expenseapplication/models/expensemodel.dart';

class FilterExpenseModel {
  String title;
  num totalAmt;
  List<expenseModel> mExpenses;

  FilterExpenseModel(
      {required this.title, required this.totalAmt, required this.mExpenses});
}
