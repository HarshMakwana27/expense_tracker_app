import 'package:flutter/material.dart';
import 'package:expense_app/expenses.dart';

void main() {
  runApp(
    const MaterialApp(
      //theme: ThemeData(useMaterial3: true),
      home: Expenses(),
    ),
  );
}
