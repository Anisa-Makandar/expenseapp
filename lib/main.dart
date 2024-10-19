import 'package:expenseapplication/bloc_helper/expense_bloc.dart';
import 'package:expenseapplication/database/dbhelper.dart';
import 'package:expenseapplication/provider_helper/providerhelper.dart';
import 'package:expenseapplication/ui/splashscreenpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context) => ExpenseBloc(dbHelper: DBHelper.getinstance())),
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.light,
      themeMode: context.watch<ThemeProvider>().getThemeVAlue()
          ? ThemeMode.dark
          : ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: SplashScreen(),
    );
  }
}
