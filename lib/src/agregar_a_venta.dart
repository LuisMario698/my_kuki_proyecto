import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kuki_proyecto/src/carrito.dart';
import 'package:kuki_proyecto/src/menu_perfil.dart';
import 'package:kuki_proyecto/src/menu_principal.dart';
import 'package:kuki_proyecto/src/menu_vendedor.dart'; // Import necesario para validadores
import 'package:kuki_proyecto/src/historial_ventas.dart';
import 'package:kuki_proyecto/src/perfil_vendedor.dart';

class AgregarAVenta extends StatefulWidget {
  const AgregarAVenta({Key? key}) : super(key: key);

  @override
  AgregarAVentaState createState() => AgregarAVentaState();
}

class AgregarAVentaState extends State<AgregarAVenta> {
  String? selectedSector; // Inicializado como null por defecto
  String? selectedFile; // Inicializado como null por defecto
  File? profileImage; // Archivo para la imagen seleccionada

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _cantidadController = TextEditingController();

  Future<void> _pickProfileImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      setState(() {
        profileImage = File(result.files.single.path!);
      });
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    _precioController.dispose();
    _cantidadController.dispose();
    super.dispose();
  }

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Centra los elementos
          children: [
            Text(
              "Agregar Producto para venta",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre del producto',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _descripcionController,
              decoration: InputDecoration(
                labelText: 'Descripción',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _precioController,
              decoration: InputDecoration(
                labelText: 'Precio',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(height: 10),
            TextField(
              controller: _cantidadController,
              decoration: InputDecoration(
                labelText: 'Cantidad',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedSector,
              items:
                  [
                        'Ganadero',
                        'Pesquero',
                        'Construcción',
                        'Agricola',
                        'Manufacturero',
                      ]
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  selectedSector = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Categoría',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: GestureDetector(
                onTap: _pickProfileImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      profileImage != null
                          ? FileImage(profileImage!)
                          : AssetImage('assets/images/perfil1.jpeg')
                              as ImageProvider,
                  child:
                      profileImage == null
                          ? Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: Colors.white,
                          )
                          : null,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_nombreController.text.isEmpty ||
                    _descripcionController.text.isEmpty ||
                    _precioController.text.isEmpty ||
                    _cantidadController.text.isEmpty ||
                    selectedSector == null ||
                    profileImage == null) {
                  // Mostrar mensaje de error si algún campo está vacío
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Por favor, completa todos los campos'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  // Mostrar mensaje de confirmación
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Producto guardado exitosamente'),
                      backgroundColor: Colors.green,
                    ),
                  );

                  // Limpiar los campos
                  _nombreController.clear();
                  _descripcionController.clear();
                  _precioController.clear();
                  _cantidadController.clear();
                  setState(() {
                    selectedSector = null;
                    profileImage = null;
                  });
                }
              },
              child: Text('Guardar Producto'),
              style: ElevatedButton.styleFrom(
                iconColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 16),
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
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuPrincipal(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.history, color: Colors.white),
                iconSize: 30, // Tamaño del ícono
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
                ), // Ícono de perfil del vendedor
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
        Text(
          label,
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
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
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centra el contenido
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                textAlign: TextAlign.center,
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
