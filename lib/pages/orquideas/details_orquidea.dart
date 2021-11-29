// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login_inforquidea/models/orquidea.dart';
import 'package:login_inforquidea/pages/widgets/header_widget.dart';
import 'package:login_inforquidea/providers/orquidea.dart';

import 'globals.dart' as globals;

class DetailOrquidea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailOrquideaState();
  }
}

class _DetailOrquideaState extends State<DetailOrquidea> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

  OrquideaModel orquideaSeleccionada =
      OrquideaModel.fromValues("", "", "", "", "", "", "", "", "", "");

  @override
  void initState() {
    super.initState();

    obtenerOrquidea();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detalles Orquídea",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
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
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              right: 20,
            ),
            child: Stack(
              children: <Widget>[
                Icon(Icons.add_shopping_cart_rounded),
                Positioned(
                  right: 0,
                  child: Container(),
                )
              ],
            ),
          )
        ],
      ),

      //detalles de la orquídea
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //Container(height: 100, child: HeaderWidget(100, false,Icons.house_rounded),),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        //boxShadow: [BoxShadow(color: Colors.black12)] ,
                        ),
                    child: const Image(
                        image: AssetImage('assets/images/catleya.png')),
                  ),
                  Card(
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              ...ListTile.divideTiles(
                                color: Colors.grey,
                                tiles: [
                                  ListTile(
                                    title: Text("Nombre Común:"),
                                    subtitle: Text(orquideaSeleccionada.nombre),
                                  ),
                                  ListTile(
                                    title: Text("Tipo de Crecimiento:"),
                                    subtitle: Text(orquideaSeleccionada.tipo),
                                  ),
                                  ListTile(
                                    title: Text("Origen:"),
                                    subtitle: Text(orquideaSeleccionada.origen),
                                  ),
                                  ListTile(
                                    title: Text("Familia:"),
                                    subtitle:
                                        Text(orquideaSeleccionada.familia),
                                  ),
                                  ListTile(
                                    title: Text("Características de Floración"),
                                    subtitle:
                                        Text(orquideaSeleccionada.cFloracion),
                                  ),
                                  ListTile(
                                    title: Text("Ubicación"),
                                    subtitle:
                                        Text(orquideaSeleccionada.ubicacion),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future obtenerOrquidea() async {
    OrquideaProvider op = OrquideaProvider();
    OrquideaByIDResponse obid =
        await op.obtenerOrquideaPorId(globals.orquideaSeleccionadaID);

    setState(() {
      orquideaSeleccionada = obid.orquidea;
    });
  }
}
