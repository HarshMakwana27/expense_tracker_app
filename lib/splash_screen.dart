import 'dart:async';

import 'package:expense_app/expenses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 10),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const Expenses())));

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/expenses.png',
            height: 150,
          ),
          const SizedBox(height: 20),
          Text(
            'Expense Manager',
            style: GoogleFonts.notoSerif(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ]),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
