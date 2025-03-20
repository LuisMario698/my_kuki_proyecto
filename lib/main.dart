import 'package:flutter/material.dart';
import 'package:kuki_proyecto/src/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(), // Ahora la pantalla inicial es el Login
    );
  }
}
