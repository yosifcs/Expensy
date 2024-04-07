import 'package:expensy/Theme/my_theme.dart';
import 'package:expensy/View/Home/home_screen.dart';
import 'package:expensy/ViewModel/firebase_expense_repo.dart';
import 'package:expensy/bloc/AddExpense/get_expenseBloc/get_expenses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense Tracker",
    theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      home: BlocProvider(
        create: (context) => GetExpensesBloc(
            FirebaseExpenseRepo()
        )..add(GetExpenses()),
        child: const HomeScreen(),
      ),
    );
  }
}