import 'dart:convert';
import 'dart:io';

import 'package:arte_mex/caracteristicas/comerciante/producto/data/models/obtener_producto_model.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/data/models/producto_model.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/producto.dart';
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../../../../../utilidad/host.dart';
import '../../domian/entities/obtener_producto.dart';

abstract class ProductoRemoteDataSource {
  Future<bool> crearProductoRemoteDataSource(Producto producto);
  Future<bool> editarProductoRemoteDataSource(String id, Producto producto);
  Future<void> eliminarProductoRemoteDataSource(String id);
  Future<List<ObtenerProducto>> extraerProductosRemoteDataSource(String id);
  Future<String> subirImagenRemoteDataSource(File file);
}

class ProductoRemoteDataSourceImpl implements ProductoRemoteDataSource {
  final host = hostComerciante();
  @override
  Future<bool> crearProductoRemoteDataSource(Producto producto) async {
    var productoModel = ProductoModel.fronEntity(producto);
    var productoBody = productoModel.toJson();
    var body = jsonEncode(productoBody);
    var url = Uri.parse("$host/vendedor/producto/Registro");
    var response = await http.post(url, body: body, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode == 200) return true;

    return false;
  }

  @override
  Future<bool> editarProductoRemoteDataSource(
      String id, Producto producto) async {
    var productoModel = ProductoModel.fronEntity(producto);
    var productoBody = productoModel.toJson();
    var body = jsonEncode(productoBody);
    var url = Uri.parse("$host/vendedor/actualizar/producto/$id");
    var response = await http.put(url, body: body, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode == 200) return true;

    return false;
  }

  @override
  Future<void> eliminarProductoRemoteDataSource(String id) async {
    var url = Uri.parse("$host/vendedor/producto/eliminar/$id");
    try {
      await http.delete(url);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ObtenerProducto>> extraerProductosRemoteDataSource(
      String id) async {
    var url = Uri.parse("$host/vendedor/publicasion/busqueda/$id");
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

  @override
  Future<String> subirImagenRemoteDataSource(File file) async {
    final dio = Dio();
    final body = FormData.fromMap({
      'imagen': await MultipartFile.fromFile(file.path),
    });
    final response = await dio.post("$host/vendedor/imagen", data: body);

    return response.toString();
  }
}
