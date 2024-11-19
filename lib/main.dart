import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Paginas/Menu.dart';

//funcion principal
void main(){
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intercambio de palabras' ,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home: PantallaMenu(),
    );
  }
}

