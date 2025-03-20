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
      body: Column(
        children: [
          // Parte superior: Logo de la empresa
          Expanded(
            flex: 2,
            child: Center(
              child: Image.asset(
                'assets/images/Logito.png', // Asegúrate de tener un archivo de logo en la carpeta assets
                width: 150,
                height: 150,
              ),
            ),
          ),
          // Parte inferior: Formulario de registro
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Center(child: Text('USUARIO')),
                  SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 10),
                  Center(child: Text('CORREO ELECTRÓNICO')),
                  SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 10),
                  Center(child: Text('CONTRASEÑA')),
                  SizedBox(height: 5),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 10),
                  Center(child: Text('CONFIRMAR CONTRASEÑA')),
                  SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
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
        ],
      ),
    );
  }
}
