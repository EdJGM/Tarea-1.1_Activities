import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SueldoSemanal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SueldoSemanalState();
}

class _SueldoSemanalState extends State<SueldoSemanal> {
  final TextEditingController _controllerSueldoBase = TextEditingController();
  final TextEditingController _controllerHorasNormales = TextEditingController();
  final TextEditingController _controllerHorasNocturnas = TextEditingController();
  double? _sueldoSemanal;

  // Método para calcular el sueldo semanal
  double calcularSueldoSemanal(double sueldoBase, int horasNormales, int horasNocturnas) {
    const double pagoNormal = 2000.0;
    const double pagoNocturno = pagoNormal * 1.3;

    double totalExtraNormal = horasNormales * pagoNormal;
    double totalExtraNocturno = horasNocturnas * pagoNocturno;

    return sueldoBase + totalExtraNormal + totalExtraNocturno;
  }

  // Método que se ejecuta al presionar el botón de calcular
  void _calcularSueldo() {
    double sueldoBase = double.tryParse(_controllerSueldoBase.text) ?? 0;
    int horasNormales = int.tryParse(_controllerHorasNormales.text) ?? 0;
    int horasNocturnas = int.tryParse(_controllerHorasNocturnas.text) ?? 0;

    setState(() {
      _sueldoSemanal = calcularSueldoSemanal(sueldoBase, horasNormales, horasNocturnas);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Sueldo Semanal'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controllerSueldoBase,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese el sueldo base'),
            ),
            TextField(
              controller: _controllerHorasNormales,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Horas extra normales'),
            ),
            TextField(
              controller: _controllerHorasNocturnas,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Horas extra nocturnas'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularSueldo,
              child: Text('Calcular Sueldo Semanal'),
            ),
            SizedBox(height: 40),
            if (_sueldoSemanal != null)
              Text(
                'Sueldo semanal: \$$_sueldoSemanal',
                style: TextStyle(fontSize: 24),
              ),
          ],
        ),
      ),
    );
  }
}
