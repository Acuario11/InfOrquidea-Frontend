import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_inforquidea/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;
  _SplashScreenState(){
    
    Timer(const Duration(milliseconds: 2000), (){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false);
      });
    });

    Timer(
      const Duration(milliseconds: 10), (){
        setState(() {
          _isVisible = true; //
        });
    }
  );
}

  @override
  Widget build(BuildContext context) {

    return Container(
     decoration: BoxDecoration(
       gradient: LinearGradient(
           //colors: Color.()#FFFFFF,
           // [Theme.of(context).primaryColorDark,Theme.of(context).primaryColor],
         colors: [Theme.of(context).primaryColorDark,Theme.of(context).primaryColor],
         begin: const FractionalOffset(0, 0),
         end: const FractionalOffset(1.0, 0.0),
         stops: const [0.0,1.0],
         tileMode: TileMode.clamp
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0: 0,
        duration: const Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 280.0,
            width: 280.0,

            child: const Center(
              child: ClipRRect(
                //child: Icon(Icons.android_outlined, size: 128,),
                  //child: Icon(Icons.filter_vintage_outlined, size: 128,),
                child:
                Image(
                    height: 280,
                    width: 280 ,
                    image: AssetImage('assets/images/infor.png'))
              ),
            ),
            /*decoration: BoxDecoration(
              //shape: BoxShape.rectangle,
              //color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 2.0,
                  offset: const Offset(5.0, 3.0),
                  spreadRadius: 2.0
                )
              ]
            ),*/
          ),
        ),
      ),
    );
  }
}