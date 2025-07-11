import 'package:flutter/material.dart';
import 'package:flutter_train_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.light,
          primary: Colors.purple,
          secondaryContainer: Colors.grey[200],
          tertiary: Colors.white,
          onTertiaryContainer: Colors.black,
          tertiaryContainer: Colors.grey[300],
          outline: Colors.grey[300]
        ),
        scaffoldBackgroundColor: Colors.white
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.dark,
          primary: Colors.purple,
          secondaryContainer: Colors.black,
          tertiary: Colors.white30,
          onTertiaryContainer: Colors.white,
          onSurface: Colors.white,
          tertiaryContainer: Colors.grey[300],
          outline: Colors.white30,
        ),
        scaffoldBackgroundColor: Colors.black //배경색
      ),
      home: HomePage());
  }
}


