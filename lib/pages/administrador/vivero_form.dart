

import 'package:flutter/material.dart';
import 'package:login_inforquidea/models/vivero.dart';
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
    ViveroModel vivero = ViveroModel.fromValues("", fotoV, nombre, tipo,
        distrito , provincia , region , direccion , telefono , "1");

    ViveroProvider vp = ViveroProvider();

    //Create
    ViveroCreateResponse ocr = await vp.crearVivero(vivero);

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => ProfilePage()),
            (Route<dynamic> route) => false);
  }
}