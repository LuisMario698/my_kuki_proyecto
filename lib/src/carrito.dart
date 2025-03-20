import 'package:flutter/material.dart';
import 'package:kuki_proyecto/src/menu_principal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kuki_proyecto/src/login.dart';
import 'package:kuki_proyecto/src/menu_perfil.dart';
import 'package:kuki_proyecto/src/cursos.dart';

class Carrito extends StatefulWidget {
  const Carrito({Key? key}) : super(key: key);

  @override
  _CarritoState createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  Widget buildProductCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.amber[200],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/conchas.jpeg', // Use local asset
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Producto vendido por: Kuki imports',
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Concha marina',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Eliminar',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Comprar',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                DropdownButton<String>(
                  value: '45 kg',
                  items:
                      ['15 kg', '30 kg', '45 kg']
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text('\$20', style: TextStyle(fontSize: 16)),
              SizedBox(height: 4),
              Text('Envío: \$150', style: TextStyle(fontSize: 14)),
              SizedBox(height: 4),
              Text(
                'Total: \$170',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 130,
                left: 80,
                bottom: 2,
                top: 2,
              ),
              child: Image.asset(
                'assets/images/Logito2.png', // Ensure this image exists in your assets folder
                height: 60,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildProductCard(),
            buildProductCard(),
            buildProductCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Container(
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.white),
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuPrincipal(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                iconSize: 30,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings, color: Colors.white),
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuPerfil()),
                  );
                },
              ),
              IconButton(
                icon: Image.asset(
                  'assets/images/birrete.png',
                  width: 30,
                  height: 30,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cursos()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
