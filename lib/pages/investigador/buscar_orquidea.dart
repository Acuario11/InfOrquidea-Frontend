
import 'package:flutter/material.dart';

class SearchOrquidea extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SearchOrquideaState();
  }

}

class _SearchOrquideaState extends State<SearchOrquidea>{
  double _drawerIconSize = 24;
  double _drawerFontSize =17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Orquideas",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0.5,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).primaryColorDark,]
              )
          ),
        ),
        // aquí se puede agregar íconos de notificaciones
      ),
    );
  }

}
//https://www.youtube.com/watch?v=G_sZ4gNh63s&t=3230s