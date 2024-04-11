import 'dart:convert';

import 'package:arte_mex/caracteristicas/comerciante/pedidos/data/models/pedidos_model.dart';
import 'package:flutter/material.dart';

import '../../../../../utilidad/host.dart';
import '../../domain/entities/pedido.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

abstract class PedidosRemoteDataSource {
  Future<List<Pedido>> obtenerPedidosRemoteDataSource(String id);
  Future<bool> actualizarEstatusPedidoRemoteDataSource(
      String id, String estatus, String empresa);
}

class PedidosRemoteDataSourceImpl implements PedidosRemoteDataSource {
  final host = hostComerciante();

  @override
  Future<List<Pedido>> obtenerPedidosRemoteDataSource(String id) async {
    var url = Uri.parse("$host/vendedor/pedidos/$id");
    List<PedidoModel> pedidos = [];

    try {
      var response = await http.get(url);
      debugPrint(response.body);
      if (response.statusCode == 200 && jsonDecode(response.body) != null) {
        pedidos = jsonDecode(response.body)
            .map<PedidoModel>((producto) => PedidoModel.fromJson(producto))
            .toList();
        return pedidos;
      }
      return pedidos;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> actualizarEstatusPedidoRemoteDataSource(
      String id, String estatus, String empresa) async {
    var url = Uri.parse("$host/vendedor/pedido/actualizar/$id");

    final body = {"estatus": estatus, "empresa": empresa};
    final bodyEncode = jsonEncode(body);
    var response =
        await http.put(url, body: bodyEncode, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
