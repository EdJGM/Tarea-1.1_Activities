import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalcularCostoScreen extends StatefulWidget {
  @override
  _CalcularCostoScreenState createState() => _CalcularCostoScreenState();
}

class _CalcularCostoScreenState extends State<CalcularCostoScreen> {
  final TextEditingController _cantidadController = TextEditingController();
  String _resultado = "";

  int calcularCostoTotal(int cantidadDeCamisas) {
    if (cantidadDeCamisas <= 0) {
      throw ArgumentError("La cantidad de camisas debe ser mayor a cero.");
    }

    if (cantidadDeCamisas > 3) {
      return cantidadDeCamisas * 4000;
    } else {
      return cantidadDeCamisas * 4800;
    }
  }
  void _calcular() {
    int? cantidadDeCamisas = int.tryParse(_cantidadController.text);

    if (cantidadDeCamisas != null && cantidadDeCamisas > 0) {
      try {
        int costoTotal = calcularCostoTotal(cantidadDeCamisas);
        setState(() {
          _resultado = 'El costo total es: \$${costoTotal}';
        });
      } catch (e) {
        setState(() {
          _resultado = e.toString();
        });
      }
    } else {
      setState(() {
        _resultado = 'Por favor, ingrese una cantidad válida de camisas.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Costo de Camisas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cantidadController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese la cantidad de camisas'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcular,
              child: Text('Calcular Costo'),
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
