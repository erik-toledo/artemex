import 'dart:convert';

import 'package:arte_mex/caracteristicas/comprador/historial/data/models/comprador_historial_compra_model.dart';

import '../../../../../utilidad/host.dart';
import '../../domain/entities/comprador_historial_compra.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

abstract class CompradorHistorialCompraRemoteDataSource {
  Future<List<CompradorHistorialCompra>> obtenerHistorialCompraRemoteDataSource(
      String id);
}

class CompradorHistorialCompraRemoteDataSourceImpl
    implements CompradorHistorialCompraRemoteDataSource {
  final String host = hostComprador();
  @override
  Future<List<CompradorHistorialCompra>> obtenerHistorialCompraRemoteDataSource(
      String id) async {
    var url = Uri.parse("$host/comprador/historia/comprador/$id");
    List<CompradorHistorialCompra> historial = [];
    try {
      var response = await http.get(url);
      if (response.statusCode == 200 && jsonDecode(response.body) != "") {
        historial = jsonDecode(response.body)
            .map<CompradorHistorialCompraModel>((historial) =>
                CompradorHistorialCompraModel.fromJson(historial))
            .toList();
      }
      return historial;
    } catch (e) {
      rethrow;
    }
  }
}
