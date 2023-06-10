import 'package:expense_app/splash_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

const kColorScheme = ColorScheme(
  primary: Color.fromARGB(071370, 7, 19, 112),
  onPrimary: Color.fromARGB(255, 255, 255, 255),
  secondary: Color.fromRGBO(90, 93, 187, 1),
  tertiary: Color.fromARGB(255, 37, 249, 26),
  brightness: Brightness.light,
  onSecondary: Color.fromARGB(255, 0, 0, 0),
  error: Colors.red,
  onError: Colors.black,
  onBackground: Color.fromARGB(255, 0, 0, 0),
  onSurface: Color.fromARGB(255, 0, 0, 0),
  background: Color.fromARGB(255, 255, 255, 255),
  surface: Color.fromARGB(255, 255, 255, 255),
);

const kDarkColorScheme = ColorScheme(
    primary: Color.fromRGBO(3, 218, 197, 1),
    onPrimary: Colors.black,
    secondary: Color.fromRGBO(187, 134, 252, 1),
    tertiary: Color.fromARGB(255, 37, 249, 26),
    brightness: Brightness.dark,
    onSecondary: Colors.black,
    error: Colors.redAccent,
    onError: Colors.black,
    onBackground: Colors.white,
    onSurface: Colors.white,
    background: Colors.black,
    surface: Colors.black);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
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
      home: const SplashScreen(),
    ),
  );
  // });
}
