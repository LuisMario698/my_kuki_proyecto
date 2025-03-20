import 'package:flutter/material.dart';
import 'package:kuki_proyecto/src/informacion_personal.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crea una nueva cuenta')),
      body: SingleChildScrollView(
        // <-- Hace la pantalla desplazable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/images/Logito.png',
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(height: 20),
              _buildTextField("USUARIO"),
              _buildTextField("CORREO ELECTRÓNICO"),
              _buildTextField("CONTRASEÑA", obscureText: true),
              _buildTextField("CONFIRMAR CONTRASEÑA", obscureText: true),
              SizedBox(height: 20),
              Text(
                '¿Ya te registraste? Inicia sesión aquí.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InformacionPersonal(),
                    ),
                  );
                },
                child: Text('Continuar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 5),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
