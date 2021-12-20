import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:login_inforquidea/providers/image.dart';
import 'package:provider/provider.dart';

import 'pages/splash_screen.dart';

void main() {
  runApp(LoginUIApp());
}

class LoginUIApp extends StatelessWidget {
  //Color _primaryColor = HexColor('#329664');
  Color _primaryColor = HexColor('#FFC867');
  Color _accentColor = HexColor('##FFFFFF');
  Color _primaryDarkColor = HexColor('#64c896');

  final ThemeData theme = ThemeData();

  // This widget is the root of your application.
  @override
  /*MultiProvider(
  providers: [
    Provider<Something>(create: (_) => Something()),
    Provider<SomethingElse>(create: (_) => SomethingElse()),
    Provider<AnotherThing>(create: (_) => AnotherThing()),
  ],
  child: someWidget,
)*/
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ImagenSeleccion>(create: (_) => ImagenSeleccion()),
      ],
      child: MaterialApp(
        title: 'Flutter Login UI',
        theme: ThemeData(
          primaryColor: _primaryColor,
          colorScheme: theme.colorScheme.copyWith(secondary: _accentColor),
          primaryColorDark: _primaryDarkColor,
          scaffoldBackgroundColor: Colors.grey.shade100,
          primarySwatch: Colors.green,

        ),
        home:  SplashScreen(title: 'Flutter Login UI'),
      ),
    );
  }
}


