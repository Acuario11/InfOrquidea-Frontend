import 'dart:convert';

//Responses

class ViveroCreateResponse {
  //Vacio
  ViveroModel vivero =
  ViveroModel.fromValues("", "", "", "", "", "", "", "", "", "", "", "");

  ViveroCreateResponse.fromAPI(Map jsonViveroResponse) {
    //Datos de la Api (Respuesta)
    ViveroModel vm = ViveroModel(jsonViveroResponse["savedVivero"]);
    vivero = vm;
  }
}

class ViveroByIDResponse {
  //Vacio
  ViveroModel vivero =
  ViveroModel.fromValues("", "", "", "", "", "", "", "", "", "", "", "");

  ViveroByIDResponse.fromAPI(Map jsonViveroResponse) {
    //Datos de la Api (Respuesta)
    ViveroModel vm = ViveroModel(jsonViveroResponse["vivero"]);
    vivero = vm;
  }
}

class ViveroAllResponse {
  List<ViveroModel> viveroList = <ViveroModel>[];

  ViveroAllResponse.fromAPI(Map jsonViveroResponse) {
    for (int i = 0; i < jsonViveroResponse["viveroList"].length; i++) {
      ViveroModel vm = ViveroModel(jsonViveroResponse["viveroList"][i]);
      viveroList.add(vm);
    }
  }
}

//Models

class ViveroModel {
  String id="";
  String fotoV ="";
  String nombre ="";
  String tipo ="";
  String distrito ="";
  String provincia ="";
  String region ="";
  String direccion ="";
  String telefono ="";
  String latitud = "";
  String longitud = "";
  String estado = "";

  ViveroModel(Map jsonViveroResponse) {
    this.id = jsonViveroResponse["_id"];
    this.fotoV = jsonViveroResponse["foto_v"];
    this.nombre = jsonViveroResponse["nombre"];
    this.tipo = jsonViveroResponse["tipo"];
    this.distrito = jsonViveroResponse["distrito"];
    this.provincia = jsonViveroResponse["provincia"];
    this.region = jsonViveroResponse["region"];
    this.direccion = jsonViveroResponse["direccion"];
    this.telefono = jsonViveroResponse["telefono"];
    this.latitud = jsonViveroResponse["latitud"];
    this.longitud = jsonViveroResponse["longitud"];
    this.estado = jsonViveroResponse["estado"];
  }

  ViveroModel.fromValues(
      String id,
      String fotoV,
      String nombre,
      String tipo,
      String distrito,
      String provincia,
      String region,
      String direccion,
      String telefono,
      String latitud,
      String longitud,
      String estado)
  {
    this.id = id;
    this.fotoV = fotoV;
    this.nombre = nombre;
    this.tipo = tipo;
    this.distrito = distrito;
    this.provincia = provincia;
    this.region = region;
    this.direccion = direccion;
    this.telefono = telefono;
    this.latitud = latitud;
    this.longitud = longitud;
    this.estado = estado;
  }
}
