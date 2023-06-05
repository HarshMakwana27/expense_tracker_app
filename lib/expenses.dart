import 'package:expense_app/widgets/expenses_list.dart';
import 'package:expense_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registeredExpenses = [
    Expense(
        title: 'Swiggy',
        amount: 200,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Farewell',
        amount: 500,
        date: DateTime.now(),
        category: Category.leisue)
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense tracker app'),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
              child: registeredExpenses.isEmpty
                  ? const Center(child: Text('No Expenses to show'))
                  : ExpensesList(registeredExpenses, removeExpense)),
        ],
      ),
    );
  }
}
