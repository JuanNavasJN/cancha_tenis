import 'package:cancha_tenis/constants/colors.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme:
              const ColorScheme.dark().copyWith(primary: kSuccessColor)),
      title: 'CanchaTenis',
      home: const HomeScreen(),
    );
  }
}
