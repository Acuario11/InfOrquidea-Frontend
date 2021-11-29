// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_inforquidea/models/orquidea.dart';
import 'package:login_inforquidea/providers/orquidea.dart';

import '../splash_screen.dart';
import 'details_orquidea.dart';
import 'globals.dart' as globals;

class CreateOrquidea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateOrquideaState();
  }
}

class _CreateOrquideaState extends State<CreateOrquidea> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

  List<OrquideaModel> orquideasList = <OrquideaModel>[];

  //List<String> _getValues() => List.generate(10, (index) => 'Item: $index');

  //List<Widget>? _getWidgets()
  //=> _getValues().map((e) => MyItemWidget(value: e)).toList();

  @override
  void initState() {
    super.initState();

    obtenerOrquideas();
  }

  @override
  Widget build(BuildContext context) {
    //final values= _getValues();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ORQUIDEAS",
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
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            child: Stack(
              children: <Widget>[
                Icon(Icons.search_rounded),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),

                    //constraints: BoxConstraints(minWidth: 12, minHeight: 12,),
                  ),
                )
              ],
            ),
          )
        ], // aquí se puede agregar íconos de notificaciones
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: buildOrquideas(),
      ),
      /*body: CustomScrollView(
        // https://www.youtube.com/watch?v=ggJ-Wy9P7VM
        // https://www.youtube.com/watch?v=YeV2ZYn2_JI diseño de Cards

        slivers: [
          //https://www.youtube.com/watch?v=sFCXqfvTOck
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index){
                    print('Item :$index');
                    return Container(
                      height: 150,
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: FittedBox(
                        child: Text(index.toString()),
                      ),
                    );
                  },
                childCount: 1,
              ),
          ),
        ],
      ), */
    );
  }



  Future obtenerOrquideas() async {
    List<OrquideaModel> orquideasListX = <OrquideaModel>[];
    OrquideaProvider op = OrquideaProvider();
    OrquideaAllResponse oar = await op.obtenerOrquideas();

    for (int i = 0; i < oar.orquideaList.length; i++) {
      orquideasListX.add(oar.orquideaList[i]);
    }

    setState(() {
      orquideasList = orquideasListX;
      print("NOMBRE PRUEBA: ${orquideasList[0].nombre}");
    });
  }

  List<Widget> buildOrquideas() {
    List<Widget> orquideas = <Widget>[];

    for (int i = 0; i < orquideasList.length; i++) {
      orquideas.add(Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: FittedBox(
            child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x0802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      //INFORMACION
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                child: Text(
                              //NOMBRE DE LA ORQUIDEA
                              "${orquideasList[i].nombre}",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                child: Text(
                              //Tipo de Orquidea
                              "${orquideasList[i].tipo}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                child: Text(
                                  //Ubicación de la Orquidea
                              "${orquideasList[i].ubicacion}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                child: Text(
                                  //Especie de Orquidea
                              "${orquideasList[i].especie}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                //ver detalles o datos completos de la orquidea
                                text: 'Ver más',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    globals.orquideaSeleccionadaID =
                                        orquideasList[i].id;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailOrquidea()));
                                  },
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColorDark),
                              ),
                            ])),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: const Image(
                        fit: BoxFit.contain,
                        alignment: Alignment.topRight,
                        image: AssetImage('assets/images/catleya.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ), //
        ),
      ));
    }

    return orquideas;
  }
}
