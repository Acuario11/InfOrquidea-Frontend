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

}
