import 'dart:convert';

import 'package:login_inforquidea/models/vivero.dart';
import 'package:http/http.dart' as http;

class ViveroProvider {
  Future<ViveroCreateResponse> crearVivero(ViveroModel vivero) async {
    var url = Uri.parse("http://10.0.2.2:8283/api/vivero/create");

    print("Dentro del provider (vivero create).");

    var responseHttp = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "foto_v": vivero.fotoV,
          "nombre": vivero.nombre,
          "tipo": vivero.tipo,
          "distrito": vivero.distrito,
          "provincia": vivero.provincia,
          "region": vivero.region,
          "direccion": vivero.direccion,
          "telefono": vivero.telefono,
          "estado": "1"
        }));


    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    ViveroCreateResponse viveroResponse =
      ViveroCreateResponse.fromAPI(jsonResponse);

    return viveroResponse;
  }

  Future<ViveroAllResponse> obtenerViveros() async {
    var url = Uri.parse("http://10.0.2.2:8283/api/vivero/all");

    print("Dentro del provider (get all vivero).");

    var responseHttp = await http.get(url);

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    ViveroAllResponse viveroAllResponse =
      ViveroAllResponse.fromAPI(jsonResponse);

    return viveroAllResponse;
  }

  Future<ViveroByIDResponse> obtenerViveroPorId(String id) async {
    var url = Uri.parse("http://10.0.2.2:8283/api/vivero/$id");

    print("Dentro del provider (get by ID vivero).");

    var responseHttp = await http.get(url);

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    ViveroByIDResponse viveroByIDResponse =
    ViveroByIDResponse.fromAPI(jsonResponse);

    return viveroByIDResponse;
  }
}