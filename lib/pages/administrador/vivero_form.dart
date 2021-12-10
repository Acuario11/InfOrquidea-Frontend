

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:login_inforquidea/models/vivero.dart';
import 'package:login_inforquidea/pages/home/homeadministrador.dart';
import 'package:login_inforquidea/pages/home/homeadmvivero.dart';
import 'package:login_inforquidea/providers/vivero.dart';
import 'package:login_inforquidea/temas/theme_helper.dart';

import '../profile_page.dart';

class ViveroForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ViveroFormState();
  }

}

class _ViveroFormState extends State<ViveroForm>{
  //Formkey
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Location location = new Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  bool _isListenLocation=false,_isGetLocation=false;

  double latitud = 0;
  double longitud = 0;


  String fotoV ="";
  String nombre ="";
  String tipo ="";
  String distrito ="";
  String provincia ="";
  String region ="";
  String direccion ="";
  String telefono ="";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
            "Registrar Viveros",
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const Text(
                          "Foto de la Orquídea",
                          style: TextStyle(color: Colors.grey),
                        ),
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                  Border.all(width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.image,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                'Nombre ',
                                'Ingresa el nombre del vivero'),
                            onSaved: (value) {
                              nombre = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: ThemeHelper().textInputDecoration(
                                'Tipo ',
                                'Ingresa el tipo de vivero'),
                            onSaved: (value) {
                              tipo = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: ThemeHelper().textInputDecoration(
                                'Distrito', 'Ingresa el distrito del vivero'),
                            onSaved: (value) {
                              distrito  = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: ThemeHelper().textInputDecoration(
                                'Provincia', 'Ingresa la provincia del vivero'),
                            onSaved: (value) {
                              provincia  = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: ThemeHelper().textInputDecoration(
                                'Región', 'Ingresa la región del vivero'),
                            onSaved: (value) {
                              region  = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: ThemeHelper().textInputDecoration(
                                'Dirección',
                                'Ingresa la dirección del vivero'),
                            onSaved: (value) {
                              direccion  = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.url,
                            decoration: ThemeHelper().textInputDecoration(
                                'Teléfono',
                                'Ingresa el teléfono del vivero'),
                            onSaved: (value) {
                              telefono  = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),

                        StreamBuilder(
                            stream: location.onLocationChanged,
                            builder: (context, snapshot){
                              if(snapshot.connectionState != ConnectionState.waiting)
                              {
                                var data = snapshot.data as LocationData;
                                latitud = data.latitude!;
                                longitud = data.longitude!;
                                return Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.url,
                                    decoration: ThemeHelper().textInputDecoration(
                                        'Latitud',
                                        'Latitud'),
                                    controller: TextEditingController(text: "${data.latitude}"),
                                  ),
                                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                );

                              }
                              else return Center(child: CircularProgressIndicator(),);
                            }),


                        const SizedBox(height: 20.0),

                        StreamBuilder(
                            stream: location.onLocationChanged,
                            builder: (context, snapshot){
                              if(snapshot.connectionState != ConnectionState.waiting)
                              {
                                var data = snapshot.data as LocationData;
                                latitud = data.latitude!;
                                longitud = data.longitude!;
                                return Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.url,
                                    decoration: ThemeHelper().textInputDecoration(
                                        'Longitud',
                                        'Longitud'),
                                    controller: TextEditingController(text: "${data.longitude}"),
                                  ),
                                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                );

                              }
                              else return Center(child: CircularProgressIndicator(),);
                            }),

                        const SizedBox(height: 20.0),


                  //https://www.youtube.com/watch?v=5TrH52M9Pg8 location obtener
                        //https://www.youtube.com/watch?v=2p4snh1-JQM

                  /*Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              //style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  "OBTENER POSICIÓN".toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                            ),
                            SizedBox(width: 15,),
                          ],

                        ),*/
                        const SizedBox(height: 10.0),
                        Container(
                          decoration:
                          ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "REGISTRAR".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                //create vivero
                                fotoV = "vivero123.jpg";
                                guardarVivero();
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration:
                          ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "CANCELAR".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(height: 20.0),
                      ],
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

  guardarVivero() async {

    _serviceEnabled = await location.serviceEnabled();
    if(!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if(_serviceEnabled) return;
    }

    _permissionGranted = await location.hasPermission();
    if(_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if(_permissionGranted != PermissionStatus.granted) return;
    }
    _locationData = await location.getLocation();

    ViveroModel vivero = ViveroModel.fromValues("", fotoV, nombre, tipo,
        distrito , provincia , region , direccion , telefono , _locationData.latitude.toString(), _locationData.longitude.toString(), "1");

    ViveroProvider vp = ViveroProvider();



    //Create
    ViveroCreateResponse ocr = await vp.crearVivero(vivero);

    setState(() {
      _isGetLocation= true;

    });

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeAdministrador()),
            (Route<dynamic> route) => false);

  }
}