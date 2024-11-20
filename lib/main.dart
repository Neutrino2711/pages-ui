import 'package:flutter/material.dart';
import 'package:swipe_start/screens/swipable_start.dart';

import 'decorations/custom_color.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        extensions: const [
          CustomColors(
            swipeGradient:  LinearGradient(
              colors: [
                Color(0xFFB3242A),
                Color(0xFFB8252B),
                Color(0xFF9D1F24),
                Color(0xFF741A1E),
                Color(0xFF76181B),
                Color(0xFF6F161A),
                Color(0xFF5D1316),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            swipeBorderColor: Color(0xFF163EC8),
            swipeThumbColor:  Color(0xFF163EC8),
          ),
        ],
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
           titleLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Color(0xFF163EC8),
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          headlineSmall: TextStyle(
            fontSize: 20,
            color: Color(0xFF6983D9),
          ),
        ),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SwipableStartScreen()
    );
  }
}

