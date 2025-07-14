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
          outline: Colors.grey[300],
          onSurfaceVariant: Colors.grey
        ),
        scaffoldBackgroundColor: Colors.white//배경색
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.dark,
          primary: const Color.fromARGB(255, 137, 128, 138),
          secondaryContainer: Colors.white24,
          tertiary: Colors.white30,
          onTertiaryContainer: Colors.white,
          onSurface: Colors.white,
          tertiaryContainer: Colors.grey[300],
          outline: Colors.white30,
          onSurfaceVariant: Colors.white70
        ),
        scaffoldBackgroundColor: Colors.black //배경색
      ),
      home: HomePage());
  }
}


