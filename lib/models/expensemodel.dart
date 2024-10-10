import 'package:expenseapplication/database/dbhelper.dart';

class expenseModel {
  int? userId;
  int? expenseId;
  num expense_amt;
  num expense_bal;
  String expense_date;
  String expense_title;
  String expense_desc;
  String expense_type;
  int expense_cat_id;

  expenseModel({
    this.userId,
    this.expenseId,
    required this.expense_amt,
    required this.expense_date,
    required this.expense_bal,
    required this.expense_title,
    required this.expense_desc,
    required this.expense_type,
    required this.expense_cat_id,
  });
  factory expenseModel.fromMap(Map<String, dynamic> map) {
    return expenseModel(
        userId: map[DBHelper.COLUMN_USER_ID],
        expenseId: map[DBHelper.COLUMN_EXPENSE_ID],
        expense_amt: map[DBHelper.COLUMN_EXPENSE_AMOUNT],
        expense_date: map[DBHelper.COLUMN_EXPENSE_DATE],
        expense_bal: map[DBHelper.COLUMN_EXPENSE_REMBALANCE],
        expense_title: map[DBHelper.COLUMN_EXPENSE_TITLE],
        expense_desc: map[DBHelper.COLUMN_EXPENSE_DESC],
        expense_cat_id: map[DBHelper.COLUMN_CATOGORY_ID],
        expense_type: map[DBHelper.COLUMN_EXPENSE_TYPE]);
  }
  Map<String, dynamic> toMap() {
    return {
      DBHelper.COLUMN_USER_ID: userId,
      DBHelper.COLUMN_EXPENSE_AMOUNT: expense_amt,
      DBHelper.COLUMN_EXPENSE_DATE: expense_date,
      DBHelper.COLUMN_EXPENSE_REMBALANCE: expense_bal,
      DBHelper.COLUMN_EXPENSE_TITLE: expense_title,
      DBHelper.COLUMN_EXPENSE_DESC: expense_desc,
      DBHelper.COLUMN_CATOGORY_ID: expense_cat_id,
      DBHelper.COLUMN_EXPENSE_TYPE: expense_type,
    };
  }
}
