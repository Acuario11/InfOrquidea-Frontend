import 'dart:convert';

class AuthResponse {
  String message = "";
  String usuarioId = "";
  String? token = "";

  AuthResponse(Map jsonAuthResponse) {
    this.message = jsonAuthResponse["message"];
    this.usuarioId = jsonAuthResponse["usuarioId"];
    this.token = jsonAuthResponse["token"];
  }
}

class RolByUsuarioResponse {

  RolModel rol = RolModel.fromValues("","","");

  RolByUsuarioResponse.fromAPI(Map jsonRolResponse) {
    RolModel rm = RolModel(jsonRolResponse["rol"]);
    rol = rm;
  }

}

//

class RolModel {
  String id = "";
  String nombre = "";
  String estado = "";

  RolModel(Map jsonRolResponse) {
    this.id = jsonRolResponse["_id"];
    this.nombre = jsonRolResponse["nombre"];
    this.estado = jsonRolResponse["estado"];
  }

  RolModel.fromValues(String id, String nombre, String estado) {
    this.id = id;
    this.nombre = nombre;
    this.estado = estado;
  }
}