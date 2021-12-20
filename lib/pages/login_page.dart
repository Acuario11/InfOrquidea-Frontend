
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_inforquidea/models/auth.dart';
import 'package:login_inforquidea/pages/home/homeadmvivero.dart';
import 'package:login_inforquidea/pages/home/homeinvestigador.dart';
import 'package:login_inforquidea/pages/home/homepubgeneral.dart';
import 'package:login_inforquidea/pages/profile_page.dart';
import 'package:login_inforquidea/pages/registration_page.dart';
import 'package:login_inforquidea/providers/auth.dart';
import 'package:login_inforquidea/temas/theme_helper.dart';

import 'package:login_inforquidea/providers/globalsUser.dart' as globalsUser;

import 'forgot_password_page.dart';
import 'home/homeadministrador.dart';
import 'widgets/header_widget.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? Key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  double _headerHeight = 250;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String usuario = "";
  String clave = "";
  String rol = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded),
            ),
            SafeArea(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    Text(
                      "InfOrquidea",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Ingresa con tu cuenta",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 30.0),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: ThemeHelper().textInputDecoration('User Name', 'Ingresa tu usuario'),
                            onSaved: (value) {
                              usuario = value!;
                            },
                          ),
                          SizedBox(height: 30.0),
                          TextFormField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration('Password',  'Ingresa tu contraseña'),
                            onSaved: (value) {
                              clave = value!;
                            },
                          ),
                          SizedBox(height: 15.0),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                            alignment: Alignment.topRight,
                            //child: Text('¿Olvidaste tu contraseña?'),
                            child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: '¿Olvidaste tu contraseña',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPasswordPage()));
                                        },
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                                    ),
                                  ]
                                )
                            ),
                          ),
                          Container(
                            decoration: ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text('SIGN IN'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),

                              ),
                              onPressed: (){
                                //Ir a la página de información


                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  validarToken(usuario, clave);

                                }

                                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeAdministrador()));
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            //child: Text('Don´t have an account create? Create'),
                            child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: "¿No tienes una cuenta?"),
                                    TextSpan(
                                      text: ' Create',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrationPage()));
                                        },
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                                    )
                                  ]
                                )
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }

  void validarToken(String usuario, String clave) async {
    AuthProvider ap = AuthProvider();
    AuthResponse ar =
    await ap.obtenerToken(usuario, clave);

    if (ar.message != "Usuario autenticado") {
      print("Fail :(");
    } else {
      print("Login Exitoso :D");

      print(ar.message);
      print(ar.foto);
      print(ar.nombre);
      print(ar.usuarioId);
      print(ar.token);

      globalsUser.urlFotoUsuarioActual = ar.foto;
      globalsUser.nombreUsuarioActual = ar.nombre;

      //////////////////////////////////
      //Redireccion dependiendo de Rol//
      //////////////////////////////////

      RolByUsuarioResponse rbur = await ap.obtenerRolPorUsuarioId(ar.usuarioId);
      print("ROL ENCONTRADO: ${rbur.rol.nombre}");
      rol = rbur.rol.nombre;

      if(rol == "Administrador"){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeAdministrador()));
      }else if(rol == "Administrador Vivero"){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeAdmVivero()));
      }else if(rol == "Investigador"){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeInvestigador()));
      }else if(rol == "Público General"){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePubGeneral()));
      }

      //Navigator.pushNamed(context, '/home');
    }
  }

}