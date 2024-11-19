import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrdenNumerosScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrdenNumerosScreenState();
}

class _OrdenNumerosScreenState extends State<OrdenNumerosScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _num3Controller = TextEditingController();
  String _resultado = "";

  // Implementación de la función ordenarNumeros
  List<int> ordenarNumeros(int num1, int num2, int num3) {
    List<int> numeros = [num1, num2, num3];
    numeros.sort(); // Ordena la lista en orden ascendente
    return numeros;
  }

  void _ordenar() {
    int? num1 = int.tryParse(_num1Controller.text);
    int? num2 = int.tryParse(_num2Controller.text);
    int? num3 = int.tryParse(_num3Controller.text);

    if (num1 != null && num2 != null && num3 != null) {
      List<int> numerosOrdenados = ordenarNumeros(num1, num2, num3);
      setState(() {
        _resultado = 'Orden Ascendente: ${numerosOrdenados.join(', ')}';
      });
    } else {
      setState(() {
        _resultado = 'Por favor, ingrese números válidos.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ordenar Números'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese el primer número'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese el segundo número'),
            ),
            TextField(
              controller: _num3Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese el tercer número'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _ordenar,
              child: Text('Ordenar Números'),
            ),
            SizedBox(height: 20),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
