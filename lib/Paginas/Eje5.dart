import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sueldo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SueldoState();
}

class SueldoState extends State<Sueldo> {
  final TextEditingController _controllerSueldo = TextEditingController();
  final TextEditingController _controllerAntiguedad = TextEditingController();
  double? _sueldo;

  // Método para calcular el sueldo ajustado
  double calcularSueldo(double sueldo_actual, int antiguedad) {
    double sueldo = 0;
    if (antiguedad <= 10) {
      if (sueldo_actual >= 300.000) {
        sueldo = sueldo_actual + (sueldo_actual * 0.12);
      } else if (sueldo_actual > 300.00 && sueldo_actual <= 500.00) {
        sueldo = sueldo_actual + (sueldo_actual * 0.10);
      } else if (sueldo_actual > 500.00) {
        sueldo = sueldo_actual + (sueldo_actual * 0.08);
      }
    } else if (antiguedad > 10 && antiguedad < 20) {
      if (sueldo_actual >= 300.000) {
        sueldo = sueldo_actual + (sueldo_actual * 0.14);
      } else if (sueldo_actual > 300.00 && sueldo_actual <= 500.00) {
        sueldo = sueldo_actual + (sueldo_actual * 0.12);
      } else if (sueldo_actual > 500.00) {
        sueldo = sueldo_actual + (sueldo_actual * 0.10);
      }
    } else if (antiguedad >= 20) {
      sueldo = sueldo_actual + (sueldo_actual * 0.15);
    }
    return sueldo;
  }

  // Método que se ejecuta al presionar el botón de calcular sueldo
  void _calcularSueldo() {
    double sueldo_actual = double.tryParse(_controllerSueldo.text) ?? 0;
    int antiguedad = int.tryParse(_controllerAntiguedad.text) ?? 0;
    setState(() {
      _sueldo = calcularSueldo(sueldo_actual, antiguedad);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajuste de sueldos'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controllerSueldo,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese el sueldo'),
            ),
            TextField(
              controller: _controllerAntiguedad,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese la antigüedad'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularSueldo,
              child: Text('Calcular Sueldo Ajustado'),
            ),
            SizedBox(height: 40),
            if (_sueldo != null)
              Text(
                'Sueldo ajustado: \$$_sueldo',
                style: TextStyle(fontSize: 24),
              ),
          ],
        ),
      ),
    );
  }
}
