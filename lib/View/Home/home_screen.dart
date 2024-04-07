import 'package:expensy/Model/data/expense.dart';
import 'package:expensy/Model/data/mydata.dart';
import 'package:expensy/View/AddExpense/add_expense.dart';
import 'package:expensy/View/Home/widgets/card_info.dart';
import 'package:expensy/View/Home/widgets/floating_action.dart';
import 'package:expensy/View/Home/widgets/nav_bar.dart';
import 'package:expensy/View/Home/widgets/transaction_list.dart';
import 'package:expensy/View/Home/widgets/user_profile.dart';
import 'package:expensy/View/Transaction/transaction_screen.dart';
import 'package:expensy/ViewModel/firebase_expense_repo.dart';
import 'package:expensy/bloc/AddExpense/create_categorybloc/create_category_bloc.dart';
import 'package:expensy/bloc/AddExpense/create_expenseBloc/create_expense_bloc.dart';
import 'package:expensy/bloc/AddExpense/get_categoriesBloc/get_categories_bloc.dart';
import 'package:expensy/bloc/AddExpense/get_expenseBloc/get_expenses_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        _selectedIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExpensesBloc, GetExpensesState>(
        builder: (context, state) {
      if (state is GetExpensesSuccess) {
        return Scaffold(
          bottomNavigationBar: CustomBottomNavigationBar(
            onItemSelected: _onItemTapped,
            selectedItemColor: Colors.deepPurple,
          ),
          floatingActionButton: CustomFloatingActionButton(
            onPressed: () async {
              Expense? newExpense = await Navigator.push(
                context,
                MaterialPageRoute<Expense>(
                  builder: (BuildContext context) =>
                      MultiBlocProvider(providers: [
                    BlocProvider(
                      create: (context) =>
                          CreateCategoryBloc(FirebaseExpenseRepo()),
                    ),
                    BlocProvider(
                      create: (context) =>
                          GetCategoriesBloc(FirebaseExpenseRepo())
                            ..add(GetCategories()),
                    ),
                    BlocProvider(
                      create: (context) =>
                          CreateExpenseBloc(FirebaseExpenseRepo()),
                    ),
                  ], child: AddExpense()),
                ),
              );
              if (newExpense != null) {
                setState(() {
                  state.expenses.insert(0, newExpense);
                });
              }
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 20),
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: <Widget>[
                // Home widget
                Column(
                  children: [
                    UserProfileWidget(),
                    const SizedBox(height: 25),
                    BalanceInfoWidget(),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transactions",
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "View All",
                            style: GoogleFonts.poppins(
                              color: Theme.of(context).colorScheme.outline,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TransactionListWidget(state.expenses),
                  ],
                ),
                const TransactionPage()
              ],
            ),
          ),
        );
      } else {
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      }
    });
  }
}
