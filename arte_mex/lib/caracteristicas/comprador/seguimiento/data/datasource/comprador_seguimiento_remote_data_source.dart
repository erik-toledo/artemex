import 'dart:convert';

import 'package:arte_mex/caracteristicas/comprador/comprar/data/models/comprador_compra_model.dart';

import '../../../../../utilidad/host.dart';
import '../../../comprar/domain/entities/compra.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

abstract class CompradorSeguimientoRemoteDataSource {
  Future<List<Compra>> seguimientoCompra(String idCompra);
}

class CompradorSeguimientoRemoteDataSourceImpl
    implements CompradorSeguimientoRemoteDataSource {
  final String host = hostComprador();

  @override
  Future<List<Compra>> seguimientoCompra(String idCompra) async {
    var url = Uri.parse("$host/comprador/historia/comprador/$idCompra");
    List<Compra> compras = [];
    try {
      var response = await http.get(url);
      if (response.statusCode == 200 && jsonDecode(response.body) != "") {
        compras = jsonDecode(response.body)
            .map<CompradorCompraModel>(
                (compra) => CompradorCompraModel.fromJson(compra))
            .toList();
      }
      return compras;
    } catch (e) {
      rethrow;
    }
  }
}
