import 'package:expenseapplication/bloc_helper/expense_bloc.dart';
import 'package:expenseapplication/database/dbhelper.dart';
import 'package:expenseapplication/ui/splashscreenpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ExpenseBloc(dbHelper: DBHelper.getinstance()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
