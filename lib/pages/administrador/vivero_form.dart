

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:login_inforquidea/models/vivero.dart';
import 'package:login_inforquidea/pages/home/homeadministrador.dart';
import 'package:login_inforquidea/pages/home/homeadmvivero.dart';
import 'package:login_inforquidea/providers/vivero.dart';
import 'package:login_inforquidea/temas/theme_helper.dart';

import 'dart:typed_data';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:login_inforquidea/providers/image.dart';

import '../profile_page.dart';

class ViveroForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ViveroFormState();
  }

}

class _ViveroFormState extends State<ViveroForm>{

  String rutaImagen =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
  String imagenCargada = "";

//Formkey
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final picker = ImagePicker();

  _imagenSeleccion(String imgsel) async {

    final base64Img = await File(imgsel).readAsBytesSync().toString();
    Uint8List bytesList = base64Decode(base64Img);
    Image img = Image.memory(base64Decode(base64Img));
    return img.image;
    //return MemoryImage(bytesList);
  }

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

    final imgsel = Provider.of<ImagenSeleccion>(context).getimg;

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
                        ElevatedButton(
                            onPressed: () {
                              abrirSeleccionOrigen();

                            },
                            child: Text("Tomar Foto")),

                        //image: NetworkImage(imagenCargada)
                        //image: (imagenCargada.isNotEmpty)? _imagenSeleccion() : NetworkImage(imagenCargada)

                        Container(
                            margin:
                            EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: (imgsel.isNotEmpty)? Image.file(
                                File(imgsel),
                                fit: BoxFit.cover
                            ) : Container()
                        ),
                        //imagen == null ? Container() : Image.file(imagen),
                        const Text(
                          "Foto del Vivero",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          Provider.of<ImagenSeleccion>(context).getimg,
                          style: TextStyle(color: Colors.grey),
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
                                fotoV = "";
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

    //final String image = Provider.of<>(context)
    final String imgsel = Provider.of<ImagenSeleccion>(context, listen: false).getimg;
    //await Future.delayed(Duration(seconds: 2));
    await subirImagen(File(imgsel), ocr.vivero.id);

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeAdministrador()),
            (Route<dynamic> route) => false);

  }


  //IMAGE

  void obtenerImagen(ImageSource source) async {
    File image;

    var picture = await ImagePicker.platform.pickImage(source: source);
    if (picture != null) {
      image = File(picture.path);
      print("asd: ${picture.path}");
      Provider.of<ImagenSeleccion>(context, listen: false).setimg = picture.path;

      //ImageResponse ir = await subirImagen(image);
      imagenCargada=picture.path;
      //this.imagenCargada = ir.Result;
      print("=========================================================================");
      /*if (imagenCargada != '') {
        setState(() {
          this.rutaImagen = imagenCargada;
          this.imagenCargada = '';
        });
      }*/
    }
  }

  Future<ImageResponse> subirImagen(File image, String idvivero) async {
    var request = http.MultipartRequest(
      //"POST", Uri.parse("http://10.0.2.2:8283/image/upload"));
        "POST", Uri.parse("http://10.0.2.2:8283/api/image/uploadVivero/$idvivero/")
      //"POST", Uri.parse("http://10.0.2.2:8283/api/image/upload/61beba9c84b748861c7323e9 )")

    );
    //localhost:8283/api/image/upload/61b95867ab2e34166ffc2a99/

    var picture = await http.MultipartFile.fromPath("photo", image.path);
    request.files.add(picture);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    String rawResponse = utf8.decode(responseData);
    var jsonResponse = jsonDecode(rawResponse);
    print(rawResponse);
    ImageResponse ir = ImageResponse(jsonResponse);
    return ir;
  }

  Future<void> abrirSeleccionOrigen() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      obtenerImagen(ImageSource.camera);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text('Tomar una foto', style: TextStyle( fontSize: 16),),
                          ),
                          Icon(Icons.camera_alt, color: Colors.blue)
                        ],
                      ),

                    ),
                  ),
                  InkWell(
                    onTap: (){
                      obtenerImagen(ImageSource.gallery);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text('Seleccionar una foto', style: TextStyle( fontSize: 16),),
                          ),
                          Icon(Icons.image_search_sharp, color: Colors.blue)
                        ],
                      ),

                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.red
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text('Cancelar', style: TextStyle( fontSize: 16, color: Colors.white),
                              textAlign: TextAlign.center,),
                          ),
                          Icon(Icons.cancel, color: Colors.white)
                        ],
                      ),

                    ),
                  ),
                ],
              ),

            ),);
        });
  }

}

class ImageResponse {
  String Result = '';
  ImageResponse(Map jsonResponse) {
    this.Result = jsonResponse["Result"];
  }

}