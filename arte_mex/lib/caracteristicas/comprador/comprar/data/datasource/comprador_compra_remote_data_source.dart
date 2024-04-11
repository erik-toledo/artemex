import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../../../../utilidad/host.dart';

abstract class CompradorCompraRemoteDataSource {
  Future<bool> crearCompraRemoteDataSource(String idUsuario, String direccion);
}

class CompradorCompraRemoteDataSourceImpl
    implements CompradorCompraRemoteDataSource {
  final String host = hostComprador();
  @override
  Future<bool> crearCompraRemoteDataSource(
      String idUsuario, String direccion) async {
    var url = Uri.parse("$host/comprador/compra/$idUsuario");
    var bodyNoEncode = {"direccion": direccion};
    var bodyEncode = jsonEncode(bodyNoEncode);

    try {
      var response =
          await http.post(url, body: bodyEncode, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
