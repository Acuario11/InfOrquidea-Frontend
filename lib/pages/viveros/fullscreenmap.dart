
import 'package:flutter/material.dart';
import 'package:login_inforquidea/models/vivero.dart';
import 'package:login_inforquidea/providers/vivero.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget{

  @override
  _FullScreenMapState createState() => _FullScreenMapState();

}

class _FullScreenMapState extends State<FullScreenMap>{
  MapboxMapController? mapController;

  final center = LatLng(-6.472352016305042, -76.39615172024821);
  //final center = LatLng(-6.0753924080396216, -76.96540920171033);
  String selectedStyle = 'mapbox://styles/madaichuco/ckun34e991c2s18lah30rlqv0';
  final satellite = 'mapbox://styles/madaichuco/ckunbxqf19twj18p98zo5kflc';
  final streets_g = 'mapbox://styles/madaichuco/ckun3vc1h6i1519mwqgkew02m';
  final mono_verde= 'mapbox://styles/madaichuco/ckun34e991c2s18lah30rlqv0';

  List<ViveroModel> viverosList = <ViveroModel>[];

    _onMapCreated(MapboxMapController controller){
    mapController = controller;

    //_onStyleLoaded();
  }

  @override
  void initState() {
    super.initState();
    obtenerViveros();
  }

  @override
  Widget build(BuildContext context) {

    for(int i = 0; i<viverosList.length; i++){
      print("${double.parse(viverosList[i].latitud)}////${double.parse(viverosList[i].longitud)}");
      mapController?.addSymbol(SymbolOptions(
          geometry: LatLng(double.parse(viverosList[i].latitud), double.parse(viverosList[i].longitud)),
          iconSize: 2.0,
          iconImage: 'garden-11',
          //iconImage: 'marker-11',

          textField: viverosList[i].nombre,
          //textColor: '#cccccc',
          textOffset: Offset(0, 2)
      ));
    }
//https://github.com/mapbox/mapbox-gl-styles


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: crearMapa(),
        floatingActionButton: botonesFlotantes(),
      ),
    );

  }

  Column botonesFlotantes() {

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[

        //Symbolos
        /*FloatingActionButton(
            heroTag: "btn1",
            child: Icon(Icons.add_circle_outline_outlined),
            onPressed: () {
              mapController?.addSymbol(SymbolOptions(
                  geometry: center,
                  iconSize: 2.0,
                  iconImage: 'attraction-15',
                  textField: 'Montaña creada aquí',
                  textColor: '#cccccc',
                  textOffset: Offset(0, 2)
              ));
            }
        ),*/
        SizedBox(height: 5),

        //ZoomIn
        FloatingActionButton(
            heroTag: "btn2",
            child: Icon(Icons.zoom_in),
            onPressed: () {
              mapController?.animateCamera(CameraUpdate.zoomIn());
            }
        ),
        SizedBox(height: 5),

        //ZoomOut
        FloatingActionButton(
            heroTag: "btn3",
            child: Icon(Icons.zoom_out),
            onPressed: () {
              //mapController?.animateCamera(CameraUpdate.tiltTo(40));
              mapController?.animateCamera(CameraUpdate.zoomOut());
            }
        ),
        SizedBox(height: 5),

        //cambiar Estilos de Mapa
        FloatingActionButton(
            heroTag: "btn4",
            child: Icon(Icons.add_to_home_screen),
            onPressed: () {
              if (selectedStyle == mono_verde) {
                selectedStyle = streets_g;
              } else {
                if (selectedStyle == streets_g) {
                  selectedStyle = satellite;
                } else {
                  selectedStyle = mono_verde;
                }
              }
              setState(() {});
            }
        )
      ],
    );
  }

  MapboxMap crearMapa() {

    return MapboxMap(
      styleString: selectedStyle,
      onMapCreated: _onMapCreated,
      initialCameraPosition:
      CameraPosition(
          target: center,
          zoom:14
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

}