import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kuki_proyecto/src/login.dart';
import 'package:kuki_proyecto/src/menu_vendedor.dart';
import 'package:kuki_proyecto/src/agregar_a_venta.dart';
import 'package:kuki_proyecto/src/historial_ventas.dart';

class PerfilVendedor extends StatefulWidget {
  const PerfilVendedor({Key? key}) : super(key: key);

  @override
  _PerfilVendedorState createState() => _PerfilVendedorState();
}

class _PerfilVendedorState extends State<PerfilVendedor> {
  String? userName = "Vendedor Ejemplo\n⭐⭐⭐⭐⭐";
  String? profileImage = "assets/images/perfil1.jpeg";

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Perfil del Vendedor"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(profileImage!),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userName!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Editar Cuenta",
                    style: TextStyle(
                      color: Colors.green,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildProfileOption(Icons.bookmark, "Mis Ventas"),
            _buildProfileOption(Icons.favorite, "Productos Favoritos"),
            _buildProfileOption(Icons.help, "Ayuda"),
            const SizedBox(height: 20),
            Text(
              "Reseñas",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildReviewCard(
                    "Juan Pérez",
                    "Excelente vendedor, muy atento y rápido en la entrega.",
                    5,
                  ),
                  _buildReviewCard(
                    "María López",
                    "Buena calidad de productos, pero el envío tardó un poco.",
                    4,
                  ),
                  _buildReviewCard(
                    "Carlos García",
                    "Todo perfecto, muy recomendado.",
                    5,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _logout,
              child: Text(
                "Cerrar Sesión",
                style: TextStyle(color: Colors.green, fontSize: 16),
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
                icon: Icon(Icons.person, color: Colors.white),
                iconSize: 30,
                onPressed: () {
                  Navigator.pushReplacement(
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

  Widget _buildProfileOption(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(width: 10),
            Text(text, style: TextStyle(fontSize: 16, color: Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewCard(String reviewer, String comment, int rating) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: ListTile(
        contentPadding: EdgeInsets.all(12.0),
        title: Text(
          reviewer,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(comment, style: TextStyle(fontSize: 14)),
            SizedBox(height: 5),
            Row(
              children: List.generate(
                rating,
                (index) => Icon(Icons.star, color: Colors.orange, size: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
