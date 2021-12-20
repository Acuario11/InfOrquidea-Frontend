import 'package:flutter/material.dart';

class ImagenSeleccion extends ChangeNotifier{
   String _imagSeleccion = '';

   String get getimg{
     return _imagSeleccion;
   }

   set setimg (String url){
     _imagSeleccion = url;
     notifyListeners();
   }

}


