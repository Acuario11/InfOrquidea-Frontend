

import 'package:flutter/material.dart';
import 'package:login_inforquidea/models/vivero.dart';
import 'package:login_inforquidea/providers/vivero.dart';

import 'globals.dart' as globalsvivero;

class DetailVivero extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DetailViveroState();
  }
}

class _DetailViveroState extends State<DetailVivero>{

  ViveroModel viveroSeleccionado = ViveroModel.fromValues("", "", "", "", "", "", "", "", "", "", "", "");

  @override
  void initState() {
    super.initState();
    obtenerVivero();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles Vivero",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).primaryColorDark,]
            )
          ),
        ),
      ),

      //detalles de vivero
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: const BoxDecoration(

                    ),
                    child:
                    const Image(
                      image: AssetImage('assets/images/viverosf.jpg')),
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
                                    title: Text("Nombre del Centro:"),
                                    subtitle: Text(viveroSeleccionado.nombre),
                                  ),
                                  ListTile(
                                    title: Text("Tipo de Centro:"),
                                    subtitle: Text(viveroSeleccionado.tipo),
                                  ),
                                  ListTile(
                                    title: Text("Distrito:"),
                                    subtitle: Text(viveroSeleccionado.distrito),
                                  ),
                                  ListTile(
                                    title: Text("Provincia:"),
                                    subtitle: Text(viveroSeleccionado.provincia),
                                  ),
                                  ListTile(
                                    title: Text("Región"),
                                    subtitle: Text(viveroSeleccionado.region),
                                  ),

                                  ListTile(
                                    title: Text("Dirección "),
                                    subtitle: Text(viveroSeleccionado.direccion),
                                  ),
                                  ListTile(
                                    title: Text("Teléfono"),
                                    subtitle: Text(viveroSeleccionado.telefono),
                                  ),
                                  ListTile(
                                    title: Text("Representante Legal"),
                                    subtitle: Text("Josepy Cruz"),
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
            )
          ],
        ),
      ),
    );
  }

  Future obtenerVivero() async {
    ViveroProvider vp = ViveroProvider();
    ViveroByIDResponse vbid =
        await vp.obtenerViveroPorId(globalsvivero.viveroSeleccionadoID);
    setState(() {
      viveroSeleccionado= vbid.vivero;
    });
  }

}