import 'package:flutter/material.dart';
import 'package:kuki_proyecto/src/menu_principal.dart';
import 'package:kuki_proyecto/src/registro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kuki_proyecto/src/menu_vendedor.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  bool _isLoading = false;

  final List<Map<String, String>> users = [
    {'email': 'vendedorejemplo@.com', 'password': '123456', 'role': 'Vendedor'},
    {
      'email': 'comprador@ejemplo.com',
      'password': '123456',
      'role': 'Comprador',
    },
    {'email': 'vendedorejemplo.com', 'password': '123456', 'role': 'Vendedor'},
    {'email': 'comprador.com', 'password': '123456', 'role': 'Comprador'},
  ];

  void _submit() async {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();

      final user = users.firstWhere(
        (u) => u['email'] == _email && u['password'] == _password,
        orElse: () => {},
      );

      if (user.isNotEmpty) {
        setState(() => _isLoading = true);
        await _saveSession(user['email']!, user['role']!);

        if (user['role'] == 'Vendedor') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MenuVentas()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MenuPrincipal()),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Correo o contraseña incorrectos')),
        );
      }
    }
  }

  Future<void> _saveSession(String email, String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
    await prefs.setString('user_role', role);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/Logito2.png', height: 80),
              const SizedBox(height: 10),
              const Text(
                'Usuario',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildInputField(
                      'Usuario',
                      false,
                      (value) => _email = value,
                    ),
                    _buildInputField(
                      'Contraseña',
                      true,
                      (value) => _password = value,
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Registro(),
                          ),
                        );
                      },
                      child: const Text(
                        '¿Aún no tienes una cuenta? Crear cuenta',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 50,
                        ),
                      ),
                      child:
                          _isLoading
                              ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                              : const Text(
                                'Iniciar sesión',
                                style: TextStyle(fontSize: 16),
                              ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
    String hint,
    bool isPassword,
    Function(String?) onSaved,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: hint,
          filled: true,
          fillColor: Color(0xFFB5C18E),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor ingrese su $hint';
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }
}
