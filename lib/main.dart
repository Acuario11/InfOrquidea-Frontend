import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData(
        primaryColor: _primaryColor,
        colorScheme: theme.colorScheme.copyWith(secondary: _accentColor),
        primaryColorDark: _primaryDarkColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.green,

      ),
      home:  SplashScreen(title: 'Flutter Login UI'),
    );
  }
}


