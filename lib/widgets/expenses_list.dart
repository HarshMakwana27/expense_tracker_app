import 'package:expense_app/widgets/expense_item.dart';
import 'package:flutter/widgets.dart';
import 'package:expense_app/model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.registeredExpenses, {super.key});

  final List<Expense> registeredExpenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: registeredExpenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(registeredExpenses[index]),
    );
  }
}
