import 'dart:convert';

import 'package:arte_mex/caracteristicas/comerciante/producto/data/models/obtener_producto_model.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';


import '../../../../../utilidad/host.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

abstract class CompradorBusquedaRemoteDataSource {
  Future<List<ObtenerProducto>> busquedaRemoteDataSource(String producto);
}

class CompradorBusquedaRemoteDataSourceImpl
    implements CompradorBusquedaRemoteDataSource {
  @override
  Future<List<ObtenerProducto>> busquedaRemoteDataSource(
      String producto) async {
    var url = Uri.parse("${hostComprador()}/comprador/busqueda/$producto");
    var response = await http.get(url);
    List<ObtenerProducto> productos = [];
    try {
      if (response.statusCode == 200 && jsonDecode(response.body) != null) {
        productos = jsonDecode(response.body)
            .map<ObtenerProductoModel>(
                (producto) => ObtenerProductoModel.fromJson(producto))
            .toList();

        return productos;
      }
      return productos;
    } catch (e) {
      rethrow;
    }
  }
}
