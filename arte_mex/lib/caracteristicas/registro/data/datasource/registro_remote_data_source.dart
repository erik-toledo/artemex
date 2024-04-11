import 'dart:convert';

import 'package:arte_mex/caracteristicas/inicio_sesion/data/models/comerciante_model.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/data/models/comprador_model.dart';
import 'package:arte_mex/utilidad/host.dart';

import '../../../inicio_sesion/domain/entities/comerciante.dart';
import '../../../inicio_sesion/domain/entities/comprador.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

abstract class RegistroRemoteDataSource {
  Future<bool> registrarCompradorDataSource(Comprador comprador);
  Future<bool> registrarComercianteDataSource(Comerciante comerciante);
}

class RegistroRemoteDataSourceImpl implements RegistroRemoteDataSource {
  @override
  Future<bool> registrarComercianteDataSource(Comerciante comerciante) async {
    var url = Uri.parse("${hostComerciante()}/vendedor/registro");
    var bodyEntity = ComercianteModel.fromEntity(comerciante);
    var bodyToJson = bodyEntity.toJson();
    var bodyRequest = jsonEncode(bodyToJson);

    try {
      var response =
          await http.post(url, body: bodyRequest, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> registrarCompradorDataSource(Comprador comprador) async {
    var url = Uri.parse("${hostComprador()}/comprador/Registro");
    var bodyEntity = CompradorModel.fromEntity(comprador);
    var bodyToJson = bodyEntity.toJson();
    var bodyRequest = jsonEncode(bodyToJson);

    try {
      var response =
          await http.post(url, body: bodyRequest, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
