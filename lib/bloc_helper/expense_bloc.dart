import 'package:bloc/bloc.dart';
import 'package:expenseapplication/bloc_helper/expense_event.dart';
import 'package:expenseapplication/bloc_helper/expense_state.dart';
import 'package:expenseapplication/database/dbhelper.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  DBHelper dbHelper;

  ExpenseBloc({required this.dbHelper}) : super(ExpenseInitialState()) {
    on<AddExpensesEvent>(
      (event, emit) async {
        emit(ExpenseLoadingState());
        bool check = await dbHelper.addExpense(event.newExpenses);
        if (check) {
          var data = await dbHelper.getExpense();
          emit(ExpenseLoadedState(mData: data));
        } else {
          emit(ExpenseErrorState(errorMsg: "Error : Expense not added!!"));
        }
      },
    );
    on<GetInitialExpensesEvent>((event, emit) async {
      emit(ExpenseLoadingState());
      var data = await dbHelper.getExpense();
      emit(ExpenseLoadedState(mData: data));
    });
  }
}
