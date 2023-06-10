import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalExpense extends StatelessWidget {
  const TotalExpense(this.totalExpense, this.monthlyLimit, {super.key});

  final double totalExpense;
  final double monthlyLimit;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'This Month',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '${totalExpense.toInt()} / ${monthlyLimit.toInt()}',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Stack(children: [
              Container(
                height: 15,
                color: const Color.fromARGB(255, 181, 177, 177),
              ),
              Container(
                height: 15,
                color: totalExpense / monthlyLimit > 0.8
                    ? Colors.red
                    : const Color.fromARGB(255, 11, 255, 7),
                child: FractionallySizedBox(
                  widthFactor: totalExpense / monthlyLimit,
                ),
              ),
            ]),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
