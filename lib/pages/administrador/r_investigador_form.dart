

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_inforquidea/models/auth.dart';
import 'package:login_inforquidea/providers/auth.dart';
import 'package:login_inforquidea/temas/theme_helper.dart';

import '../splash_screen.dart';

class InvestigadorForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _InvestigadorFormState();
  }

}

class _InvestigadorFormState extends State<InvestigadorForm>{
  //Formkey
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String nombre = "";
  String apellido = "";
  String celular = "";

  String usuario = "";
  String clave = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Registrar Investigador",
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
                        const Text(
                          "Foto del Investigador",
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
                                'Nombres ',
                                'Ingresa nombres del Investigador'),
                            onSaved: (value) {
                              nombre = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0,),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                'Apellidos ',
                                'Ingresa apellidos del Investigador'),
                            onSaved: (value) {
                              apellido = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0,),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: ThemeHelper().textInputDecoration(
                                'Celular ',
                                'Ingresa el Celular del Investigador'),
                            onSaved: (value) {
                             celular = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: ThemeHelper().textInputDecoration(
                                'Usuario', 'Ingresa el usuario del Investigador'),
                            onSaved: (value) {
                              usuario  = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: ThemeHelper().textInputDecoration(
                                'Contraseña', 'Ingresa la contraseña del Investigador'),
                            onSaved: (value) {
                              clave  = value!;
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
                                //create investigador
                                // fotoV = "vivero123.jpg";
                                guardarInvestigador();
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
  
  guardarInvestigador() async {
    
    PersonaModel pm = PersonaModel.fromValues("", "foto.png", nombre, apellido, celular, "1");
    
    AuthProvider ap = AuthProvider();
    
    PersonaCreateResponse pcr = await ap.crearPersona(pm);
    
    UsuarioModel um = UsuarioModel.fromValues("", usuario, clave, pcr.persona.id, "1");
    
    UsuarioCreateResponse ucr = await ap.crearUsuario(um);
    
    UsuRolModel urm = UsuRolModel.fromValues("", ucr.usuario.id, "61a67c2484750e4ed21eefb8", "1");

    UsuRolCreateResponse urcr = await ap.crearUsuRol(urm);

    print("USUROL ${urm.usuarioId}");

    Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(title: "Splash Screen",)));
    
  }
  
  //https://www.youtube.com/watch?v=hR0VLfiM8aI
  //https://www.youtube.com/watch?v=lbu9nMuiYXY
  //buscador https://www.youtube.com/watch?v=G_sZ4gNh63s&t=2562s
  //https://www.youtube.com/watch?v=RcgGhUMpBvg
}