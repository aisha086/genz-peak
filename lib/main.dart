import 'package:flutter/material.dart';
import 'package:semantics_analyzer/home_screen.dart';
import 'package:semantics_analyzer/theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: MyTheme.myTheme,
      home: const HomeScreen(),
    );
  }
}
