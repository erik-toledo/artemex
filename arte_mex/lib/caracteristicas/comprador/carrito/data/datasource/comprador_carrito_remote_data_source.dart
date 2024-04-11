import 'dart:convert';

import 'package:arte_mex/caracteristicas/comprador/carrito/data/models/comprador_carro_model.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../../../../utilidad/host.dart';
import '../../domain/entities/carro.dart';

abstract class CompradorCarritoRemoteDataSource {
  Future<List<Carro>> obtenerCarritoRemoteDataSource(String id);
  Future<bool> eliminarProductoRemoteDataSource(String id);
  Future<bool> agregarProductoCarritoRemoteDataSource(String id, Carro carro);
}

class CompradorCarritoRemoteDataSourceImpl
    implements CompradorCarritoRemoteDataSource {
  final String host = hostComprador();
  @override
  Future<bool> agregarProductoCarritoRemoteDataSource(
      String id, Carro carro) async {
    var url = Uri.parse("$host/comprador/carrito/Registro");
    var bodyEntity = CompradorCarroModel.fronEntity(carro);
    var bodyToJson = bodyEntity.toJson();
    var bodyRequest = jsonEncode(bodyToJson);

    try {
     
      var response =
          await http.post(url, body: bodyRequest, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> eliminarProductoRemoteDataSource(String id) async {
    var url = Uri.parse("$host/comprador/carrito/Eliminar/$id");
    var respose = await http.delete(url);

    return respose.statusCode == 200;
  }

  @override
  Future<List<Carro>> obtenerCarritoRemoteDataSource(String id) async {
    var url = Uri.parse("$host/comprador/carrito/obtenerDatos/$id");
    List<Carro> carro = [];
    try {
      var response = await http.get(url);
      if (response.statusCode == 200 && jsonDecode(response.body) != null) {
        carro = jsonDecode(response.body)
            .map<CompradorCarroModel>(
                (carro) => CompradorCarroModel.fromJson(carro))
            .toList();
      }
      return carro;
    } catch (e) {
      rethrow;
    }
  }
}
