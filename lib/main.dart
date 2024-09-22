import 'package:flutter/material.dart';
import 'package:practice_app_firebasee/ui/LoginScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: loginScreen()
    );
  }
}
