import 'package:flutter/material.dart';
import 'package:omous/presentation/screens/splash_screen.dart';
import 'package:omous/presentation/widget/color_scheme.dart';
import 'package:omous/presentation/widget/typography.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OMOUS',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: textTheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: textTheme,
      ),
      themeMode: ThemeMode.light,
      home: SplashPage(),
    );
  }
}
