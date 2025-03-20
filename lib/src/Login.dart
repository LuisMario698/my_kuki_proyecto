import 'package:flutter/material.dart';
import 'package:kuki_proyecto/src/menu_principal.dart';
import 'package:kuki_proyecto/src/registro.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MenuPrincipal()),
        );
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Mantiene la alineación original
              children: [
                const Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                // Enlace "¿No tienes cuenta?"
                Row(
                  children: [
                    const Text("Don't have an account?"),
                    const SizedBox(width: 5),
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
                        "Sign Up Here",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Campo de Email
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value,
                ),
                const SizedBox(height: 20),

                // Campo de Password
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) => _password = value,
                ),
                const SizedBox(height: 10),

                // "Forgot Password?"
                GestureDetector(
                  onTap: () {
                    // Acción para "Forgot password?"
                  },
                  child: const Text(
                    "Forgot your password?",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Botón de Login
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child:
                        _isLoading
                            ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                            : const Text(
                              "Log In",
                              style: TextStyle(fontSize: 16),
                            ),
                  ),
                ),

                const SizedBox(height: 60),

                // Footer con copyrights
                Center(
                  child: Text(
                    "© 2023 YourCompany, Inc. All rights reserved.",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
