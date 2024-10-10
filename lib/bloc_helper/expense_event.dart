import 'package:expenseapplication/models/expensemodel.dart';

abstract class ExpenseEvent {}

class GetInitialExpensesEvent extends ExpenseEvent {}

class AddExpensesEvent extends ExpenseEvent {
  expenseModel newExpenses;
  AddExpensesEvent({required this.newExpenses});
}
