import 'package:flutter/material.dart';
import 'package:kuki_proyecto/src/agregar_a_venta.dart';
import 'package:kuki_proyecto/src/menu_perfil.dart';
import 'package:kuki_proyecto/src/tarjeta_visualizacion.dart';
import 'package:kuki_proyecto/src/historial_ventas.dart';
import 'package:kuki_proyecto/src/perfil_vendedor.dart';

class MenuVentas extends StatefulWidget {
  const MenuVentas({Key? key}) : super(key: key);

  @override
  _MenuVentasState createState() => _MenuVentasState();
}

class _MenuVentasState extends State<MenuVentas> {
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
              'Mis Productos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _buildProductCard(
                    'Residuos de cartón',
                    '200 kg de cartón reciclado',
                    '\$150',
                    'assets/images/madera.jpeg',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TarjetaVisualizacion(),
                        ),
                      );
                    },
                  ),
                  _buildProductCard(
                    'Vidrio reciclado',
                    '100 kg de vidrio triturado',
                    '\$120',
                    'assets/images/plasticos.jpeg',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TarjetaVisualizacion(),
                        ),
                      );
                    },
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuVentas()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.history, color: Colors.white),
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistorialVentas(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ), // Cambiado a ícono de perfil
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PerfilVendedor(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.add_circle, color: Colors.white),
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AgregarAVenta(),
                    ),
                  );
                },
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
    String productImagePath, {
    VoidCallback? onPressed,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          GestureDetector(
            onTap: onPressed ?? () {},
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
          ),
        ],
      ),
    );
  }
}
