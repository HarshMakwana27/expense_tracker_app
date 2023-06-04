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
      context: context,
      builder: (ctx) => const NewExpense(),
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
          Expanded(child: ExpensesList(registeredExpenses)),
        ],
      ),
    );
  }
}
