import 'dart:convert';

import 'package:login_inforquidea/models/auth.dart';
import 'package:http/http.dart' as http;

class AuthProvider {
  Future<AuthResponse> obtenerToken(String usuario, String clave) async {
    var url = Uri.parse("http://10.0.2.2:8283/api/auth/login");

    print("Dentro del provider (login).");

    var responseHttp =
    await http.post(url, body: {'usuario': usuario, 'clave': clave});

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    AuthResponse authResponse = AuthResponse(jsonResponse);

    return authResponse;
  }

  Future<RolByUsuarioResponse> obtenerRolPorUsuarioId(String usuarioId) async {
    var url = Uri.parse("http://10.0.2.2:8283/api/usu_rol/usu/$usuarioId");

    print("Dentro del provider (get rol by usuario ID).");

    var responseHttp =
    await http.get(url, headers: {'Content-Type': 'application/json'});

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    RolByUsuarioResponse rolByUsuarioResponse = RolByUsuarioResponse.fromAPI(jsonResponse);

    return rolByUsuarioResponse;
  }

  //

  Future<PersonaCreateResponse> crearPersona(PersonaModel persona) async {
    var url = Uri.parse("http://10.0.2.2:8283/api/persona/create");

    print("Dentro del provider (persona create).");

    var responseHttp = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "foto": persona.foto,
          "nombre": persona.nombre,
          "apellido": persona.apellido,
          "telefono": persona.telefono,
          "estado": "1"
        }));

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    PersonaCreateResponse personaResponse =
    PersonaCreateResponse.fromAPI(jsonResponse);

    return personaResponse;
  }

  Future<UsuarioCreateResponse> crearUsuario(UsuarioModel usuario) async {
    var url = Uri.parse("http://10.0.2.2:8283/api/usuario/create");

    print("Dentro del provider (usuario create).");

    var responseHttp = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "usuario": usuario.usuario,
          "clave": usuario.clave,
          "personaId": usuario.personaId,
          "estado": "1"
        }));

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    UsuarioCreateResponse usuarioResponse =
    UsuarioCreateResponse.fromAPI(jsonResponse);

    return usuarioResponse;
  }

  Future<UsuRolCreateResponse> crearUsuRol(UsuRolModel usuRol) async {
    var url = Uri.parse("http://10.0.2.2:8283/api/usu_rol/create");

    print("Dentro del provider (usu_rol create).");

    var responseHttp = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "usuarioId": usuRol.usuarioId,
          "rolId": usuRol.rolId,
          "estado": "1"
        }));

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    UsuRolCreateResponse usuRolResponse =
    UsuRolCreateResponse.fromAPI(jsonResponse);

    return usuRolResponse;
  }

}
