import 'package:cancha_tenis/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/app_state.dart';
import 'db/initialize.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDb();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MaterialApp(
        theme: ThemeData(
            colorScheme:
                const ColorScheme.dark().copyWith(primary: kSuccessColor)),
        title: 'CanchaTenis',
        home: const HomeScreen(),
      ),
    );
  }
}
