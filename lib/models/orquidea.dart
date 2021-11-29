import 'dart:convert';

//Responses

class OrquideaCreateResponse {
  //Vacio
  OrquideaModel orquidea =
      OrquideaModel.fromValues("", "", "", "", "", "", "", "", "", "");

  OrquideaCreateResponse.fromAPI(Map jsonOrquideaResponse) {
    //Datos de la Api (Respuesta)
    OrquideaModel om = OrquideaModel(jsonOrquideaResponse["savedOrquidea"]);
    orquidea = om;
  }
}

class OrquideaByIDResponse {
  //Vacio
  OrquideaModel orquidea =
      OrquideaModel.fromValues("", "", "", "", "", "", "", "", "", "");

  OrquideaByIDResponse.fromAPI(Map jsonOrquideaResponse) {
    //Datos de la Api (Respuesta)
    OrquideaModel om = OrquideaModel(jsonOrquideaResponse["orquidea"]);
    orquidea = om;
  }
}

class OrquideaAllResponse {
  List<OrquideaModel> orquideaList = <OrquideaModel>[];

  OrquideaAllResponse.fromAPI(Map jsonOrquideaResponse) {
    for (int i = 0; i < jsonOrquideaResponse["orquideaList"].length; i++) {
      OrquideaModel om = OrquideaModel(jsonOrquideaResponse["orquideaList"][i]);
      orquideaList.add(om);
    }
  }
}

//Models

class OrquideaModel {
  String id = "";
  String fotoO = "";
  String nombre = "";
  String tipo = "";
  String origen = "";
  String familia = "";
  String especie = "";
  String cFloracion = "";
  String ubicacion = "";
  String estado = "";

  OrquideaModel(Map jsonOrquideaResponse) {
    this.id = jsonOrquideaResponse["_id"];
    this.fotoO = jsonOrquideaResponse["foto_o"];
    this.nombre = jsonOrquideaResponse["nombre"];
    this.tipo = jsonOrquideaResponse["tipo"];
    this.origen = jsonOrquideaResponse["origen"];
    this.familia = jsonOrquideaResponse["familia"];
    this.especie = jsonOrquideaResponse["especie"];
    this.cFloracion = jsonOrquideaResponse["c_floracion"];
    this.ubicacion = jsonOrquideaResponse["ubicacion"];
    this.estado = jsonOrquideaResponse["estado"];
  }

  OrquideaModel.fromValues(
      String id,
      String fotoO,
      String nombre,
      String tipo,
      String origen,
      String familia,
      String especie,
      String cFloracion,
      String ubicacion,
      String estado)
  {
    this.id = id;
    this.fotoO = fotoO;
    this.nombre = nombre;
    this.tipo = tipo;
    this.origen = origen;
    this.familia = familia;
    this.especie = especie;
    this.cFloracion = cFloracion;
    this.ubicacion = ubicacion;
    this.estado = estado;
  }
}
