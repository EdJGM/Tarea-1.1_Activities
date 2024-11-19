import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Eje5.dart';
import 'Ejer1_ordenarNumeros.dart';
import 'Ejer2_Calcular.dart';
import 'Eje3_ecuacion.dart';
import 'Eje4_calculoTriangulo.dart';
import 'Eje6_sueldoSemanal.dart';

class PantallaMenu extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _PantallaMenuState();
}

class _PantallaMenuState extends State<PantallaMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Ejercicios de desarrollo de aplicaciones moviles'),
        backgroundColor: Colors.lightBlue,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Center(
                child: Text(
                  'Menú',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            ListTile(
              title: const Text('Ejercicio1'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrdenNumerosScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Ejercicio2'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalcularCostoScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Ejercicio3'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ecuacion()),
                );
              },
            ),
            ListTile(
              title: const Text('Ejercicio4'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Triangulo()),
                );
              },
            ),
            ListTile(
              title: const Text('Ejercicio5'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sueldo()),
                );
              },
            ),
            ListTile(
              title: const Text('Ejercicio6'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SueldoSemanal()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center( // Aquí se coloca el contenido principal de la pantalla
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenido al Menú Principal',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              'assets/logo.png', // Ruta de la imagen en tu carpeta assets
            ),
            const SizedBox(height: 20), // Espaciado entre la imagen y el texto

          ],
        ),
      ),
    );
  }
}
