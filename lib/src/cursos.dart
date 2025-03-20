import 'package:flutter/material.dart';
import 'package:kuki_proyecto/src/menu_principal.dart';
import 'package:kuki_proyecto/src/carrito.dart';
import 'package:kuki_proyecto/src/menu_perfil.dart';

class Cursos extends StatefulWidget {
  const Cursos({Key? key}) : super(key: key);

  @override
  _CursosState createState() => _CursosState();
}

class _CursosState extends State<Cursos> {
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
              child: Image.asset('assets/images/Logito2.png', height: 60),
            ),
            SizedBox(width: 10),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cursos Disponibles',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _buildCourseCard(
                    'Curso de Reciclaje',
                    'Aprende técnicas avanzadas de reciclaje.',
                    'assets/images/curso1.jpeg',
                  ),
                  _buildCourseCard(
                    'Curso de Compostaje',
                    'Cómo hacer compostaje casero.',
                    'assets/images/curso2.jpeg',
                  ),
                  _buildCourseCard(
                    'Estrategias de Sostenibilidad',
                    'Conceptos clave para un mundo sostenible.',
                    'assets/images/curso3.jpeg',
                  ),
                ],
              ),
            ),
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
                icon: Icon(Icons.home, color: Colors.white),
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
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Carrito()),
                  );
                },
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
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseCard(String title, String description, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 120,
                  color: Colors.grey[300],
                  child: Center(child: Icon(Icons.broken_image, size: 50)),
                );
              },
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(12.0),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
