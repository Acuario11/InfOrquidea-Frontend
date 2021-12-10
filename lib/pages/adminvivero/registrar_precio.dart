
import 'package:flutter/material.dart';

class RegistrarPrecio extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _RegistrarPrecio();
  }

}

class _RegistrarPrecio extends State<RegistrarPrecio>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Registrar Precio de Orquideas",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0.5,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColorDark,
                  ])),
        ),
      ),
    );
  }

}