import 'package:expense_app/widgets/expense_item.dart';
import 'package:flutter/material.dart';

import 'package:expense_app/model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.registeredExpenses, this.removeExpense, {super.key});

  final List<Expense> registeredExpenses;
  final void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: registeredExpenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error,
            child: Center(
                child: Text(
              'delete',
              style: TextStyle(color: Theme.of(context).colorScheme.background),
            )),
          ),
          onDismissed: (direction) {
            removeExpense(registeredExpenses[index]);
          },
          key: ValueKey(registeredExpenses[index]),
          child: ExpenseItem(registeredExpenses[index])),
    );
  }
}
