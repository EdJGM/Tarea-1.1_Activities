import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Triangulo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => TrianguloState();
}

class TrianguloState extends State<Triangulo>{
  //codigo
  final TextEditingController _controllerA =TextEditingController();
  final TextEditingController _controllerB =TextEditingController();
  final TextEditingController _controllerC =TextEditingController();

  int a=0; int b=0; int c=0;
  String resultado = '';

  void _tipoTriangulo(){
    setState(() {
      if (a<=0 && b<=0 && c<=0){
        resultado = 'Es un triangulo';
      } else {
        if (a<(b+c) && b<(a+c) && c<(a+b)){
          resultado = 'Es un triangulo';
          if (a==b && b==c){
            resultado = ' $resultado. Es Equilatero';
          } else {
            if (a==b || a==c || b==c){
              resultado = '$resultado. Es Isosceles';
            } else {
              resultado =  '$resultado. Es Escaleno';
            }
          }
        } else {
          resultado = 'NO es un triangulo';
        }
      }
    });
  }

  //diseno
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Tipo de Triangulo'),
        backgroundColor: Colors.blueGrey,
      ),

      body: Center(
        child: Container(
          width: 600,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: _controllerA,
                  decoration: const InputDecoration(
                    labelText: 'Lado A',
                  ),
                  onChanged: (value){
                    a = int.tryParse(value) ?? 0;
                  }
              ),
              TextField(
                  controller: _controllerB,
                  decoration: const InputDecoration(
                    labelText: 'Lado B',
                  ),
                  onChanged: (value){
                    b = int.tryParse(value) ?? 0;
                  }
              ),
              TextField(
                  controller: _controllerC,
                  decoration: const InputDecoration(
                    labelText: 'Lado C',
                  ),
                  onChanged: (value){
                    c = int.tryParse(value) ?? 0;
                  }
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _tipoTriangulo,
                child: const Text('Verificar'),
              ),
              const SizedBox(height: 20),
              Text(
                resultado,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}