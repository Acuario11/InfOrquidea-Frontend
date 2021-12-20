import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_inforquidea/models/orquidea.dart';
import 'package:login_inforquidea/pages/home/homeadministrador.dart';
import 'package:login_inforquidea/pages/home/homeinvestigador.dart';
import 'package:login_inforquidea/providers/image.dart';
import 'package:login_inforquidea/providers/orquidea.dart';
import 'package:login_inforquidea/temas/theme_helper.dart';

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../profile_page.dart';

class OrquideaForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OrquideaFormState();
  }
}

class _OrquideaFormState extends State<OrquideaForm> {

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

  String fotoO = "";
  String nombre = "";
  String tipo = "";
  String origen = "";
  String familia = "";
  String especie = "";
  String cFloracion = "";
  String ubicacion = "";

  @override
  Widget build(BuildContext context) {
    final imgsel = Provider.of<ImagenSeleccion>(context).getimg;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Registrar Orquideas",
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
        // aquí se puede agregar íconos de notificaciones
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
                          "Foto de la Orquídea",
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
                                'Nombre Común',
                                'Ingresa el nombre de la planta'),
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
                                'Tipo de Crecimiento',
                                'Ingresa el tipo de crecimiento de la planta'),
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
                                'Origen', 'Ingresa el origen de la planta'),
                            onSaved: (value) {
                              origen = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: ThemeHelper().textInputDecoration(
                                'Familia', 'Ingresa la familia de la planta'),
                            onSaved: (value) {
                              familia = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: ThemeHelper().textInputDecoration(
                                'Especie', 'Ingresa la especie de la planta'),
                            onSaved: (value) {
                              especie = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: ThemeHelper().textInputDecoration(
                                'Características de Floración',
                                'Ingresa características de Floración'),
                            onSaved: (value) {
                              cFloracion = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.url,
                            decoration: ThemeHelper().textInputDecoration(
                                'Ubicación',
                                'Ingresa la ubicación de la planta'),
                            onSaved: (value) {
                              ubicacion = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
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
                                //create orquidea
                                fotoO = "";

                                guardarOrquidea();
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
            ),
          ],
        ),
      ),
    );
  }


  guardarOrquidea() async {
    OrquideaModel orquidea = OrquideaModel.fromValues("", fotoO, nombre, tipo,
        origen, familia, especie, cFloracion, ubicacion, "1");

    OrquideaProvider op = OrquideaProvider();

    //Create
    OrquideaCreateResponse ocr = await op.crearOrquidea(orquidea);
    print("ocr: ${ocr.orquidea.id}");

    //final String image = Provider.of<>(context)
    final String imgsel = Provider.of<ImagenSeleccion>(context, listen: false).getimg;
    //await Future.delayed(Duration(seconds: 2));
    await subirImagen(File(imgsel), ocr.orquidea.id);

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeInvestigador()),
        (Route<dynamic> route) => false);
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

  Future<ImageResponse> subirImagen(File image, String idorquidea) async {
    var request = http.MultipartRequest(
        //"POST", Uri.parse("http://10.0.2.2:8283/image/upload"));
    "POST", Uri.parse("http://10.0.2.2:8283/api/image/upload/$idorquidea/")
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

}

class ImageResponse {
  String Result = '';
  ImageResponse(Map jsonResponse) {
    this.Result = jsonResponse["Result"];
  }

}
