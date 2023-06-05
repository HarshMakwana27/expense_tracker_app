import 'package:flutter/material.dart';
import 'package:expense_app/expenses.dart';

final kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 10, 21, 183));

const kDarkColorScheme = ColorScheme(
    primary: Color.fromRGBO(187, 134, 252, 1),
    onPrimary: Colors.black,
    secondary: Color.fromRGBO(3, 218, 197, 1),
    brightness: Brightness.dark,
    onSecondary: Colors.black,
    error: Colors.redAccent,
    onError: Colors.black,
    onBackground: Colors.white,
    onSurface: Colors.white,
    background: Colors.black,
    surface: Colors.black);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.primary,
          foregroundColor: kDarkColorScheme.background,
        ),
        scaffoldBackgroundColor: kDarkColorScheme.background,
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.background,
        ),
        scaffoldBackgroundColor: kColorScheme.background,
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
