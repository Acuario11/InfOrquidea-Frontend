
import 'package:flutter/material.dart';
import 'package:login_inforquidea/pages/administrador/r_investigador_form.dart';
import 'package:login_inforquidea/pages/administrador/vivero_form.dart';
import 'package:login_inforquidea/pages/widgets/header_widget.dart';

import '../splash_screen.dart';

class HomeAdministrador extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeAdministrador();
  }
}

class _HomeAdministrador extends State<HomeAdministrador>{
  double _drawerIconSize = 24;
  double _drawerFontSize =17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("M.P. Administrador",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
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
                Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(6),),
                    constraints: BoxConstraints(minWidth: 12, minHeight: 12,),
                    child: Text('5', style: TextStyle(color: Colors.white, fontSize: 8,), textAlign: TextAlign.center,),
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
                leading: Icon(Icons.person_add_alt_1, size:_drawerIconSize, color: Theme.of(context).primaryColorDark,),
                title: Text('Registrar Investigador', style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).primaryColorDark),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InvestigadorForm()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.person_search, size:_drawerIconSize, color: Theme.of(context).primaryColorDark,),
                title: Text('Buscar Investigador', style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).primaryColorDark),),
                onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => VerVivero()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.add_business, size: _drawerIconSize,color: Theme.of(context).primaryColorDark,),
                title: Text('Registrar Vivero',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).primaryColorDark),),
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => ViveroForm()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.manage_search_rounded, size: _drawerIconSize,color: Theme.of(context).primaryColorDark,),
                title: Text('Buscar Vivero',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).primaryColorDark),),
                onTap: () {
                  //Navigator.push( context, MaterialPageRoute(builder: (context) => MyApp()),);
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