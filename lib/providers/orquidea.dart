import 'dart:convert';

import 'package:login_inforquidea/models/orquidea.dart';
import 'package:http/http.dart' as http;

class OrquideaProvider {
  Future<OrquideaCreateResponse> crearOrquidea(OrquideaModel orquidea) async {
    var url = Uri.parse("http://10.0.2.2:8283/api/orquidea/create");

    print("Dentro del provider (orquidea create).");

    var responseHttp = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "foto_o": orquidea.fotoO,
          "nombre": orquidea.nombre,
          "tipo": orquidea.tipo,
          "origen": orquidea.origen,
          "familia": orquidea.familia,
          "especie": orquidea.especie,
          "c_floracion": orquidea.cFloracion,
          "ubicacion": orquidea.ubicacion,
          "estado": "1"
        }));

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    OrquideaCreateResponse orquideaResponse =
        OrquideaCreateResponse.fromAPI(jsonResponse);

    return orquideaResponse;
  }

  Future<OrquideaAllResponse> obtenerOrquideas() async {
    var url = Uri.parse("http://10.0.2.2:8283/api/orquidea/all");

    print("Dentro del provider (get all orquidea).");

    var responseHttp = await http.get(url);

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    OrquideaAllResponse orquideaAllResponse =
        OrquideaAllResponse.fromAPI(jsonResponse);

    return orquideaAllResponse;
  }

  Future<OrquideaByIDResponse> obtenerOrquideaPorId(String id) async {
    var url = Uri.parse("http://10.0.2.2:8283/api/orquidea/$id");

    print("Dentro del provider (get by ID orquidea).");

    var responseHttp = await http.get(url);

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    OrquideaByIDResponse orquideaByIDResponse =
        OrquideaByIDResponse.fromAPI(jsonResponse);

    return orquideaByIDResponse;
  }
}
