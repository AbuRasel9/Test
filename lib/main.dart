import 'package:flutter/material.dart';
import 'package:sample/screen/login_screen.dart';
import 'package:sample/screen/user_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
