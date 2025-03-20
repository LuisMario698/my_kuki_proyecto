import 'package:flutter/material.dart';
import 'package:kuki_proyecto/src/menu_vendedor.dart';
import 'package:kuki_proyecto/src/agregar_a_venta.dart';
import 'package:kuki_proyecto/src/perfil_vendedor.dart';

class HistorialVentas extends StatefulWidget {
  const HistorialVentas({Key? key}) : super(key: key);

  @override
  _HistorialVentasState createState() => _HistorialVentasState();
}

class _HistorialVentasState extends State<HistorialVentas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Historial de Ventas"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Historial de Ventas",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildSaleCard(
                    "Venta #1",
                    "200 kg de cartón reciclado",
                    "\$150",
                  ),
                  _buildSaleCard(
                    "Venta #2",
                    "100 kg de vidrio triturado",
                    "\$120",
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistorialVentas(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.white),
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

  Widget _buildSaleCard(String title, String description, String price) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: ListTile(
        contentPadding: EdgeInsets.all(12.0),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(description, style: TextStyle(fontSize: 14)),
            SizedBox(height: 5),
            Text(price, style: TextStyle(fontSize: 14, color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
