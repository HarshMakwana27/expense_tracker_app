import 'package:expense_app/graph.dart';
import 'package:expense_app/total_expense.dart';
import 'package:expense_app/widgets/expenses_list.dart';
import 'package:expense_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/model/expense.dart';
import 'package:google_fonts/google_fonts.dart';

final List<Expense> registeredExpenses = [
  Expense(
      title: 'Swiggy',
      amount: 450,
      date: DateTime.now(),
      category: Category.food),
];

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(addExpense),
    );
  }

  void addExpense(Expense newExpense) {
    setState(() {
      registeredExpenses.add(newExpense);
    });
  }

  void removeExpense(Expense expense) {
    final removedIndex = registeredExpenses.indexOf(expense);
    setState(() {
      registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(
              () {
                registeredExpenses.insert(removedIndex, expense);
              },
            );
          },
        ),
      ),
    );
  }

  double getTotalExpense() {
    double totalExpense = 0;
    for (int i = 0; i < registeredExpenses.length; i++) {
      totalExpense = totalExpense + registeredExpenses[i].amount;
    }

    return totalExpense;
  }

  void getGraph() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Graph()));
  }

  final double monthlyLimit = 500;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense tracker app'),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: width < height
          ? Column(
              children: [
                Expanded(
                  child: registeredExpenses.isEmpty
                      ? const Center(
                          child: Text('No Expenses to show'),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Total Expense',
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: getGraph,
                                    child: Text(
                                      'view more >',
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TotalExpense(getTotalExpense(), monthlyLimit),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Expense List',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                child: ExpensesList(
                                    registeredExpenses, removeExpense),
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            )
          : registeredExpenses.isEmpty
              ? const Center(
                  child: Text('No Expenses to show'),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: width / 2,
                                child: Row(
                                  children: [
                                    Text(
                                      'Total Expense',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    TextButton(
                                      onPressed: getGraph,
                                      child: Text(
                                        'view more >',
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: width / 2,
                                child: TotalExpense(
                                    getTotalExpense(), monthlyLimit),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ExpensesList(registeredExpenses, removeExpense),
                    ),
                  ],
                ),
    );
  }
}
