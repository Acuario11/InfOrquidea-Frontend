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

class UsuarioCreateResponse {

  //Vacio
  UsuarioModel usuario =
  UsuarioModel.fromValues("", "", "", "", "");

  UsuarioCreateResponse.fromAPI(Map jsonUsuarioResponse) {
    //Datos de la Api (Respuesta)
    UsuarioModel um = UsuarioModel(jsonUsuarioResponse["savedUsuario"]);
    usuario = um;
  }

}

class UsuRolCreateResponse {

  //Vacio
  UsuRolModel usuRol =
  UsuRolModel.fromValues("", "", "", "");

  UsuRolCreateResponse.fromAPI(Map jsonUsuRolResponse) {
    //Datos de la Api (Respuesta)
    UsuRolModel urm = UsuRolModel(jsonUsuRolResponse["savedUsu_rol"]);
    usuRol = urm;
  }

}

class PersonaCreateResponse {
  //Vacio
  PersonaModel persona =
  PersonaModel.fromValues("", "", "", "", "", "");

  PersonaCreateResponse.fromAPI(Map jsonPersonaResponse) {
    //Datos de la Api (Respuesta)
    PersonaModel pm = PersonaModel(jsonPersonaResponse["savedPersona"]);
    persona = pm;
  }
}

//

class PersonaModel {
  String id = "";
  String foto = "";
  String nombre = "";
  String apellido = "";
  String telefono = "";
  String estado = "";

  PersonaModel(Map jsonPersonaResponse) {
    this.id = jsonPersonaResponse["_id"];
    this.foto = jsonPersonaResponse["foto"];
    this.nombre = jsonPersonaResponse["nombre"];
    this.apellido = jsonPersonaResponse["apellido"];
    this.telefono = jsonPersonaResponse["telefono"];
    this.estado = jsonPersonaResponse["estado"];
  }

  PersonaModel.fromValues(
      String id,
      String foto,
      String nombre,
      String apellido,
      String telefono,
      String estado)
  {
    this.id = id;
    this.foto = foto;
    this.nombre = nombre;
    this.apellido = apellido;
    this.telefono = telefono;
    this.estado = estado;
  }
}


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

class UsuRolModel {
  String id = "";
  String usuarioId = "";
  String rolId = "";
  String estado = "";

  UsuRolModel(Map jsonUsuRolResponse){
    this.id = jsonUsuRolResponse["_id"];
    this.usuarioId = jsonUsuRolResponse["usuarioId"];
    this.rolId = jsonUsuRolResponse["rolId"];
    this.estado = jsonUsuRolResponse["estado"];
  }

  UsuRolModel.fromValues(String id, String usuarioId, String rolId, String estado){
    this.id = id;
    this.usuarioId = usuarioId;
    this.rolId = rolId;
    this.estado = estado;
  }

}

class UsuarioModel {
  String id = "";
  String usuario = "";
  String clave = "";
  String personaId = "";
  String estado = "";

  UsuarioModel(Map jsonUsuarioResponse){
    this. id = jsonUsuarioResponse["_id"];
    this.usuario = jsonUsuarioResponse["usuario"];
    this.clave = jsonUsuarioResponse["clave"];
    this.personaId = jsonUsuarioResponse["personaId"];
    this.estado = jsonUsuarioResponse["estado"];
  }

  UsuarioModel.fromValues(String id, String usuario, String clave, String personaId, String estado){
    this.id = id;
    this.usuario = usuario;
    this.clave = clave;
    this.personaId = personaId;
    this.estado = estado;
  }

}