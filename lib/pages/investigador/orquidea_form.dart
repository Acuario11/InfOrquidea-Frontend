import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_inforquidea/models/orquidea.dart';
import 'package:login_inforquidea/providers/orquidea.dart';
import 'package:login_inforquidea/temas/theme_helper.dart';

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

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
                        /*ElevatedButton(
                            onPressed: () {
                              abrirSeleccionOrigen();
                            },
                            child: Text("Tomar Foto")),
                        Container(
                          margin:
                          EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.7,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: NetworkImage(rutaImagen))),
                        ),*/
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
                                padding: EdgeInsets.fromLTRB(70, 70, 0, 0),
                                  child:
                                  IconButton(
                                      onPressed: () {
                                        print("a");
                                      }, icon: Icon(
                                    Icons.add_circle,
                                    color: Colors.grey.shade700,
                                    size: 25.0,
                                  )
                                /*child: IconButton.icon(
                                    IconButton(onPressed: onPressed, icon: icon)

                                  onPressed: () {  }, icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ), label: Text(""),*/
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
                                fotoO = "123.jpg";
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

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => ProfilePage()),
        (Route<dynamic> route) => false);
  }

  Future<void> abrirSeleccionOrigen() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      child: Text("Cámara"),
                      onTap: () {
                        obtenerImagen(ImageSource.camera);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(15)),
                    GestureDetector(
                      child: Text("Galería"),
                      onTap: () {
                        obtenerImagen(ImageSource.gallery);
                      },
                    ),
                  ],
                )),
          );
        });
  }

  void obtenerImagen(ImageSource source) async {
    File image;

    var picture = await ImagePicker.platform.pickImage(source: source);

    if (picture != null) {
      image = File(picture.path);

      print("asd: ${picture.path}");

      ImageResponse ir = await subirImagen(image);

      this.imagenCargada = ir.Result;

      if (imagenCargada != '') {
        setState(() {
          this.rutaImagen = imagenCargada;
          this.imagenCargada = '';
        });
      }
    }
  }

  Future<ImageResponse> subirImagen(File image) async {
    var request = http.MultipartRequest(
        "POST", Uri.parse("http://10.0.2.2:8283/image/upload"));

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
