import 'package:flutter/material.dart';
import 'package:kuki_proyecto/src/menu_perfil.dart';
import 'package:kuki_proyecto/src/carrito.dart';
import 'package:kuki_proyecto/src/cursos.dart';

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({Key? key}) : super(key: key);

  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
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
                'assets/images/Logito2.png', // Asegúrate de que esta imagen exista en tu carpeta assets
                height: 60,
              ),
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
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Sectores',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Centra los sectores
                children: [
                  _buildSectorButton('assets/images/ganadero.png', 'Ganadero'),
                  _buildSectorButton('assets/images/pesquero.png', 'Pesquero'),
                  _buildSectorButton(
                    'assets/images/construccion.png',
                    'Construcción',
                  ),
                  _buildSectorButton(
                    'assets/images/agricultor.png',
                    'Agricola',
                  ),
                  _buildSectorButton(
                    'assets/images/panufacturero.png',
                    'Panufacturero',
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            // Recomendaciones
            Text(
              'Recomendaciones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 108, // Ajusta la altura para mejorar la visibilidad
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildRecommendationButton(
                    'Concha marina',
                    'Media tonelada de concha marina',
                  ),
                  _buildRecommendationButton(
                    'Residuos de madera',
                    '500 kg de madera reciclada',
                  ),
                  _buildRecommendationButton(
                    'Plástico reciclado',
                    '300 kg de plástico reciclado',
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            // Productos con scroll vertical
            Text(
              'Productos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _buildProductCard(
                    'Concha marina',
                    'Media tonelada de concha marina',
                    '\$500',
                    'assets/images/pesquero.png',
                    'assets/images/conchas.jpeg',
                  ),
                  _buildProductCard(
                    'Residuos de madera',
                    '500 kg de madera reciclada',
                    '\$300',
                    'assets/images/construccion.png',
                    'assets/images/madera.jpeg',
                  ),
                  _buildProductCard(
                    'Plástico reciclado',
                    '300 kg de plástico reciclado',
                    '\$200',
                    'assets/images/ganadero.png',
                    'assets/images/plasticos.jpeg',
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
          height: 40, // Ajusta la altura de la barra inferior
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                iconSize: 30, // Tamaño del ícono
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                iconSize: 30, // Tamaño del ícono
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
                  'assets/images/birrete.png', // Ensure this image exists in your assets folder
                  width: 30,
                  height: 30,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Cursos(),
                    ), // Navigate to Cursos
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectorButton(String imagePath, String label) {
    return Column(
      children: [
        IconButton(
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              imagePath,
              width: 65,
              height: 65,
              fit: BoxFit.cover,
            ),
          ),
          iconSize: 65,
          onPressed: () {},
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildRecommendationButton(String title, String description) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 200,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(
    String name,
    String description,
    String price,
    String sectorIconPath,
    String productImagePath,
  ) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              productImagePath,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(12.0),
            title: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(description, style: TextStyle(fontSize: 14)),
                SizedBox(height: 5),
                Text(
                  price,
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
              ],
            ),
            trailing: Image.asset(sectorIconPath, width: 24, height: 24),
          ),
        ],
      ),
    );
  }
}
