import 'dart:convert';

import 'package:arte_mex/caracteristicas/comprador/direcciones/data/models/comprador_direccion_model.dart';
import 'package:arte_mex/utilidad/host.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../../domain/entities/direccion.dart';

abstract class CompradorDireccionRemoteDataSource {
  Future<bool> craearDireccionRemoteDataSource(String id, Direccion direccion);
  Future<bool> eliminarDireccionRemoteDataSource(String idUsuario);
  Future<bool> actualizarDireccionRemoteDataSource(
      String idUsuario, Direccion direccion);
  Future<List<Direccion>> obtenerDireccionRemoteDataSource(String idUsuario);
}

class CompradorDireccionRemoteDataSourceImpl
    implements CompradorDireccionRemoteDataSource {
  final String host = hostComprador();
  @override
  Future<bool> actualizarDireccionRemoteDataSource(
      String idUsuario, Direccion direccion) async {
    var url = Uri.parse("$host/comprador/direccion/Editar/$idUsuario");
    var bodyEntity = CompradorDireccionModel.fromEntity(direccion);
    var bodyToJson = bodyEntity.toJson();
    var bodyRequest = jsonEncode(bodyToJson);
    try {
      var response =
          await http.post(url, body: bodyRequest, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

      return response.statusCode == 200;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> craearDireccionRemoteDataSource(
      String idUsuario, Direccion direccion) async {
    var url = Uri.parse("$host/comprador/direccion/Registrase");
    var bodyEntity = CompradorDireccionModel.fromEntity(direccion);
    var bodyToJson = bodyEntity.toJson();
    var bodyRequest = jsonEncode(bodyToJson);
    try {
      var response =
          await http.post(url, body: bodyRequest, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      return response.statusCode == 200;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> eliminarDireccionRemoteDataSource(String idUsuario) async {
    var url = Uri.parse("$host/comprador/direccion/Eliminar/$idUsuario");

    try {
      var response = await http.delete(url);
      return response.statusCode == 200;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Direccion>> obtenerDireccionRemoteDataSource(
      String idUsuario) async {
    var url = Uri.parse("$host/comprador/direccion/obtenerDatos/$idUsuario");
    List<CompradorDireccionModel> direcciones = [];
    try {
      var response = await http.get(url);
      if (response.statusCode == 200 && jsonDecode(response.body) != null) {
        direcciones = jsonDecode(response.body)
            .map<CompradorDireccionModel>(
                (direccion) => CompradorDireccionModel.fromJson(direccion))
            .toList();
      }
      return direcciones;
    } catch (e) {
      rethrow;
    }
  }
}
