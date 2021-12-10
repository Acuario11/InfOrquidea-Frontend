
import 'package:flutter/material.dart';
import 'package:login_inforquidea/pages/adminvivero/registrar_precio.dart';
import 'package:login_inforquidea/pages/scanner/qr_generator.dart';
import 'package:login_inforquidea/pages/widgets/header_widget.dart';

import '../splash_screen.dart';

class HomeAdmVivero extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _HomeAdmVivero();
  }
}

class _HomeAdmVivero extends State<HomeAdmVivero>{
  double _drawerIconSize = 24;
  double _drawerFontSize =17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Home Administrador Vivero",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).primaryColorDark,]
              )
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(top: 16, right: 16,),
            child: Stack(
              children: <Widget>[
                const Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(6),),
                    constraints: const BoxConstraints(minWidth: 12, minHeight: 12,),
                    child: const Text('5', style: TextStyle(color: Colors.white, fontSize: 8,), textAlign: TextAlign.center,),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.2),
                    Theme.of(context).primaryColorDark.withOpacity(0.3),
                  ]
              )
          ),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [Theme.of(context).primaryColor, Theme.of(context).primaryColor,],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text("inforquidea@gmail.com",
                    style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.monetization_on, size:_drawerIconSize, color: Theme.of(context).primaryColorDark,),
                title: Text('Registrar Precio', style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).primaryColorDark),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrarPrecio()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.local_florist, size:_drawerIconSize, color: Theme.of(context).primaryColorDark,),
                title: Text('Buscar Orquidea', style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).primaryColorDark),),
                onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => VerVivero()),);
                },
              ),

              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.qr_code_2_outlined, size:_drawerIconSize, color: Theme.of(context).primaryColorDark,),
                title: Text('Generar QR', style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).primaryColorDark),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QRGenerator()),);
                },
              ),

              Divider(color: Theme.of(context).primaryColor, height: 1,),

              ListTile(
                leading: Icon(Icons.logout, size:_drawerIconSize, color: Theme.of(context).primaryColorDark,),
                title: Text('Logout', style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).primaryColorDark),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(title: "Splash Screen",)));
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
            ],
          ),
        ),
      ),
      // Información de Usuario
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(height: 100, child: HeaderWidget(100, false,Icons.house_rounded),),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 20, offset: const Offset(5, 5),),
                      ],
                    ),
                    child: Icon(Icons.person, size: 80, color: Colors.grey.shade300,),
                  ),
                  SizedBox(height: 20,),
                  Text('Sergio Olortegui', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Text('Musas Amázonicas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Información de Usuario",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.grey,
                                      tiles: [
                                        const ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          leading: Icon(Icons.my_location),
                                          title: Text("Location"),
                                          subtitle: Text("MOYOBAMBA"),
                                        ),
                                        const ListTile(
                                          leading: Icon(Icons.work),
                                          title: Text("Empresa"),
                                          subtitle: Text("CIFFA Perú"),
                                        ),

                                        const ListTile(
                                          leading: Icon(Icons.phone),
                                          title: Text("Phone"),
                                          subtitle: Text("123456789"),
                                        ),

                                        const ListTile(
                                          leading: Icon(Icons.person),
                                          title: Text("About Me"),
                                          subtitle: Text(
                                              "Actualmente trabajo en Musas Amazónicas y la AOAM con el proyecto de InfOrquidea"),
                                        ),

                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
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

}