import 'package:flutter/material.dart';

class TarjetaVisualizacion extends StatefulWidget {
  const TarjetaVisualizacion({Key? key}) : super(key: key);

  @override
  _TarjetaVisualizacion createState() => _TarjetaVisualizacion();
}

class _TarjetaVisualizacion extends State<TarjetaVisualizacion> {
  final TextEditingController _kilosController = TextEditingController();

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
                right: 110,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo de búsqueda
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
            SizedBox(height: 20),
            // Título del producto
            Text(
              'Concha marina',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.asset("assets/images/conchas.jpeg"),
            SizedBox(height: 10),
            Text(
              'Sector: Pesca',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              '0.45 Pesos por kilo',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Cantidad y TextField
            Text(
              'Cantidad de kilos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _kilosController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingrese la cantidad de kilos',
              ),
            ),
            SizedBox(height: 20),
            // Botones
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Acción para "Comprar ahora"
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text('Comprar ahora'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Acción para "Añadir al carrito"
                    },
                    child: Text('Añadir al carrito'),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      side: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Información de envío y descripción
            Text(
              'El envío está disponible a partir de los 50 kilos',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text(
              'Descripción',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Media tonelada de concha marina disponible para la venta, tenemos para enviar a todo peñasco y nuestro horario de entrega es de 10 am a 5pm.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
}
