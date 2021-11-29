import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_inforquidea/models/vivero.dart';
import 'package:login_inforquidea/pages/splash_screen.dart';
import 'package:login_inforquidea/pages/viveros/details_vivero.dart';
import 'package:login_inforquidea/providers/vivero.dart';
import 'globals.dart' as globalsvivero;

class VerVivero extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _VerViveroState();
  }
}

class _VerViveroState extends State<VerVivero>{
  double _drawerIconSize = 24;
  double _drawerFontSize =17;

  List<ViveroModel> viverosList = <ViveroModel>[];

  @override
  void initState() {
    super.initState();

    obtenerViveros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VIVEROS",
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
        actions: [
          Container(
            margin: EdgeInsets.only(top: 16, right: 16),
            child: Stack(
              children: <Widget>[
                Icon(Icons.search_rounded),
                Positioned(
                  right: 0,
                    child: Container(
                      padding: EdgeInsets.all(1),

                    ),
                )
              ],
            ),
          )
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: buildViveros(),

      ),
    );
  }

  Future obtenerViveros() async {
    List<ViveroModel> viverosListX = <ViveroModel>[];
    ViveroProvider vp = ViveroProvider();
    ViveroAllResponse vvar = await vp.obtenerViveros();

    for (int i=0; i < vvar.viveroList.length;i++){
      viverosListX.add(vvar.viveroList[i]);
    }

    setState(() {
      viverosList = viverosListX;
      print("NOMBRE PRUEBA: ${viverosList[0].nombre}");
    });
  }

  List<Widget> buildViveros(){
    List<Widget> viveros =<Widget>[];

    for(int i=0; i< viverosList.length;i++){
      viveros.add(Padding(
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
                      //DESDE AQUÍ LA INFORMACIÓN
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                child: Text(
                                  //Nombre del Centro
                                  "${viverosList[i].nombre}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.deepPurpleAccent,
                                    fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                          Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                child: Text(
                                  //Dirección del vivero
                                  "${viverosList[i].direccion}",
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              child: Text(
                                //Distrito y provincia del vivero
                                "${viverosList[i].distrito}",
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              child: Text(
                                //N° de Cel del vivero
                                "${viverosList[i].telefono}",
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                //ver detalles o datos completos del vivero
                                text: 'Ver más',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    globalsvivero.viveroSeleccionadoID =
                                        viverosList[i].id;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailVivero()));
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
                        image: AssetImage('assets/images/viverosf.jpg'),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),

      ));
    }

    return viveros;
  }

}