

import 'package:flutter/material.dart';
import 'package:login_inforquidea/pages/investigador/buscar_orquidea.dart';
import 'package:login_inforquidea/pages/profile_page.dart';
import 'package:login_inforquidea/temas/theme_helper.dart';

class Opciones extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OpcionesState();
  }

}

class _OpcionesState extends State<Opciones>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body:  SingleChildScrollView(
        child: Column(
        children: [
          const SizedBox(height: 40.0),
          Container(
        decoration: ThemeHelper().buttonBoxDecoration(context),
        child: ElevatedButton(
          style: ThemeHelper().buttonStyle(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Text(
              "BUSCAR ORQUIDEA".toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => SearchOrquidea()), (route) => false);

            },
        ),
      ),
      const SizedBox(height: 40.0),

      ],
    ),

    ),
    );
  }

}