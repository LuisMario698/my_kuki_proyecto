import 'package:flutter/material.dart';
import 'package:kuki_proyecto/src/Login.dart';
import 'package:kuki_proyecto/src/agregar_a_venta.dart';
import 'package:kuki_proyecto/src/busqueda_agricultor.dart';
import 'package:kuki_proyecto/src/busqueda_construccion.dart';
import 'package:kuki_proyecto/src/busqueda_ganadera.dart';
import 'package:kuki_proyecto/src/busqueda_manufactura.dart';
import 'package:kuki_proyecto/src/busqueda_pesquero.dart';
import 'package:kuki_proyecto/src/menu_principal.dart';
import 'package:kuki_proyecto/src/registro.dart';
import 'package:kuki_proyecto/src/informacion_personal.dart';
import 'package:kuki_proyecto/src/tarjeta_visualizacion.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(), // Ensure LoginScreen is implemented correctly
    );
  }
}
