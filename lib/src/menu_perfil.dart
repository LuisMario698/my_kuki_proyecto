import 'package:flutter/material.dart';
import 'package:kuki_proyecto/src/menu_principal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPerfil extends StatefulWidget {
  const MenuPerfil({Key? key}) : super(key: key);

  @override
  _MenuPerfilState createState() => _MenuPerfilState();
}

class _MenuPerfilState extends State<MenuPerfil> {
  String? userName = "John Doe";
  String? profileImage = "assets/images/perfil1.jpeg";

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MenuPrincipal()),
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
            _buildProfileOption(Icons.bookmark, "Orders"),
            _buildProfileOption(Icons.favorite, "Your favourites"),
            _buildProfileOption(Icons.account_balance_wallet, "Wallet"),
            _buildProfileOption(Icons.help, "Help"),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _logout,
              child: Text(
                "Sign Out",
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
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                iconSize: 30,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings, color: Colors.white),
                iconSize: 30,
                onPressed: () {},
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
}
