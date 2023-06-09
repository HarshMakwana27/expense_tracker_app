import 'package:flutter/material.dart';

import 'package:expense_app/model/expense.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expenseItem, {super.key});

  final Expense expenseItem;

//method for icons
  Icon getIcon(Category expenseItemCat) {
    Icon icon = const Icon(Icons.error);

    if (expenseItemCat == Category.food) {
      icon = const Icon(Icons.local_restaurant);
    }
    if (expenseItemCat == Category.leisue) {
      icon = const Icon(Icons.movie);
    }
    if (expenseItemCat == Category.travel) {
      icon = const Icon(Icons.flight);
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expenseItem.title,
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '₹${expenseItem.amount.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcon[expenseItem.category]),
                    const SizedBox(width: 6),
                    Text(expenseItem.formattedDate)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
