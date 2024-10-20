import 'package:flutter/material.dart';
import 'package:flutter_application_1/cal_main_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData.dark(), // Change Default theme into light
      home: const CalMain(),
    );
  }
}
