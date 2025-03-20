import 'package:flutter/material.dart';
import 'src/login.dart'; // Ensure this path matches the actual file location

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(), // Ensure LoginScreen is implemented correctly
    );
  }
}
