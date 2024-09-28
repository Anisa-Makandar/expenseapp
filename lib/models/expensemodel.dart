import 'package:expenseapplication/database/dbhelper.dart';

class expenseModel {
  int userId;
  int expenseId;
  int expense_amt;
  String expense_date;

  expenseModel({
    required this.userId,
    required this.expenseId,
    required this.expense_amt,
    required this.expense_date,
  });
  factory expenseModel.fromMap(Map<String, dynamic> map) {
    return expenseModel(
        userId: map[DBHelper.COLUMN_USER_ID],
        expenseId: map[DBHelper.COLUMN_EXPENSE_ID],
        expense_amt: map[DBHelper.COLUMN_EXPENSE_AMOUNT],
        expense_date: map[DBHelper.COLUMN_EXPENSE_DATE]);
  }
  Map<String, dynamic> toMap() {
    return {
      DBHelper.COLUMN_USER_ID: userId,
      DBHelper.COLUMN_EXPENSE_AMOUNT: expense_amt,
      DBHelper.COLUMN_EXPENSE_DATE: expense_date
    };
  }
}
