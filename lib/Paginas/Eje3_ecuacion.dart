import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Ecuacion extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _EcuacionState();
}

class _EcuacionState extends State<Ecuacion> {
  //codigo
  double? a; double? b; double? c; double? x1; double? x2; double? discriminante;
  String resultado = "";

  void calcularEcuacion() {
    setState(() {
      if (a == 0) {
        resultado = "El valor de 'a' no puede ser 0";
      } else {
        discriminante = b!*b! - 4*a!*c!;
        if (discriminante! < 0) {
          resultado = "No hay soluciones reales. Discriminante negativo. Raices complejas";
        } else  if (discriminante == 0) {
          x1 = -b! / (2*a!);
          resultado = "Una solucion real: x1 = x2 = $x1";
        } else {
          x1 = (-b! + sqrt(discriminante as num)) / (2*a!);
          x2 = (-b! - sqrt(discriminante as num)) / (2*a!);
          resultado = "Dos soluciones reales: x1 = $x1, x2 = $x2";
        }
      }
    });
  }

  //diseno
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Ecuación cuadrática"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Ecuación cuadrática: ax^2 + bx + c = 0"),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Valor de 'a'",
                ),
                onChanged: (value) {
                  a = double.tryParse(value);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Valor de 'b'",
                ),
                onChanged: (value) {
                  b = double.tryParse(value);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Valor de 'c'",
                ),
                onChanged: (value) {
                  c = double.tryParse(value);
                },
              ),
            ),
            ElevatedButton(
              onPressed: calcularEcuacion,
              child: Text("Calcular"),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(resultado),
            ),
          ],
        ),
      ),
    );
  }
}