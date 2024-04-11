import 'dart:convert';

import 'package:arte_mex/caracteristicas/comprador/historial/data/models/comprador_historial_compra_model.dart';
import 'package:arte_mex/utilidad/host.dart';

import '../../../../comprador/historial/domain/entities/comprador_historial_compra.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

abstract class ComercianteHistorialRemoteDataSource {
  Future<List<CompradorHistorialCompra>> obtenerHistorialVentaRemoteDataSource(
      String id);
}

class ComercianteHistorialRemoteDataSourceImpl
    implements ComercianteHistorialRemoteDataSource {
 
  @override
  Future<List<CompradorHistorialCompra>> obtenerHistorialVentaRemoteDataSource(
      String id) async {
    var url = Uri.parse("${hostComerciante()}/vendedor/historial/aprovado/$id");
    var response = await http.get(url);
    List<CompradorHistorialCompraModel> historial = [];
    try {
      if (response.statusCode == 200 && jsonDecode(response.body) != null) {
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
