import 'package:flutter/material.dart';

class BusquedaManufactura extends StatefulWidget {
  const BusquedaManufactura({Key? key}) : super(key: key);

  @override
  BusquedaManufacturaState createState() => BusquedaManufacturaState();
}

class BusquedaManufacturaState extends State<BusquedaManufactura> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centra el título
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 80,
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
        actionsPadding: const EdgeInsets.only(right: 20),
        actions: [Image.asset("assets/images/panufacturero.png", height: 50)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Centra los elementos
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
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Acción para filtrar por tipo
                  },
                  child: Text('Tipo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Acción para filtrar por precio
                  },
                  child: Text('Precio'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Acción para filtrar por cercanía
                  },
                  child: Text('Cercanía'),
                ),
              ],
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  _buildProductCard(
                    'Residuos de madera',
                    '500 kg de madera reciclada',
                    '\$300',
                    'assets/images/panufacturero.png',
                    'assets/images/madera.jpeg',
                  ),
                  _buildProductCard(
                    'Fibra de vidro molido',
                    '1 tonelada de fibra de vidrio molido',
                    '\$400',
                    'assets/images/panufacturero.png',
                    'assets/images/fibra.jpg',
                  ),
                  _buildProductCard(
                    'Plástico reciclado',
                    '300 kg de plástico reciclado',
                    '\$200',
                    'assets/images/panufacturero.png',
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
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings, color: Colors.white),
                iconSize: 30, // Tamaño del ícono
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset(
                  'assets/images/birrete.png', // Asegúrate de que esta imagen exista en tu carpeta assets
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
              textAlign: TextAlign.center,
            ),
            subtitle: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Centra el contenido
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
