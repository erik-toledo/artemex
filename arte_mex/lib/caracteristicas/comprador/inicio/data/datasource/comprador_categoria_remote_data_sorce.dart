import 'dart:convert';

import 'package:arte_mex/caracteristicas/comerciante/producto/data/models/obtener_producto_model.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/data/models/comprador_categoria_model.dart';

import '../../../../../utilidad/host.dart';
import '../../domain/entities/categoria.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

abstract class CompradorCategoriaRemoteDataSource {
  Future<List<Categoria>> obtenerCategoriaRemoteDataSource(String estado);
  Future<List<Categoria>> obtenerCategoriasRemoteDataSource();
  Future<List<ObtenerProducto>> obtenerProductosInicioRemoteDataSource();
  Future<List<ObtenerProducto>> obtenerProductosCategoriasRemoteDataSource(
      String categoria);
  Future<String> obtenerEstadoCategoriaRemoteDataSource(String estado);
}

class CompradorCategoriaRemoteDataSourceImpl
    implements CompradorCategoriaRemoteDataSource {
  final String host = hostComprador();

  @override
  Future<List<Categoria>> obtenerCategoriaRemoteDataSource(
      String estado) async {
    var url = Uri.parse("$host/comprador/categorias/$estado");
    List<Categoria> categoria = [];
    try {
      var response = await http.get(url);
      if (response.statusCode == 200 && jsonDecode(response.body) != null) {
        categoria = jsonDecode(response.body)
            .map<CompradorCategoriaModel>(
                (historial) => CompradorCategoriaModel.fromJson(historial))
            .toList();
      }
      return categoria;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ObtenerProducto>> obtenerProductosInicioRemoteDataSource() async {
    var url = Uri.parse("$host/comprador/inicio");
    List<ObtenerProducto> productos = [];
    try {
      var response = await http.get(url);
      if (response.statusCode == 200 && jsonDecode(response.body) != null) {
        productos = jsonDecode(response.body)
            .map<ObtenerProductoModel>(
                (producto) => ObtenerProductoModel.fromJson(producto))
            .toList();
      }
      return productos;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Categoria>> obtenerCategoriasRemoteDataSource() async {
    var url = Uri.parse("$host/comprador/categorias");
    List<Categoria> categoria = [];

    try {
      var response = await http.get(url);
      if (response.statusCode == 200 && jsonDecode(response.body) != null) {
        categoria = jsonDecode(response.body)
            .map<CompradorCategoriaModel>(
                (historial) => CompradorCategoriaModel.fromJson(historial))
            .toList();

        return categoria;
      }
      return categoria;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ObtenerProducto>> obtenerProductosCategoriasRemoteDataSource(
      String categoria) async {
    var url = Uri.parse("$host/comprador/busqueda/producto/$categoria");

    List<ObtenerProducto> productos = [];
    try {
      var response = await http.get(url);
      if (response.statusCode == 200 && jsonDecode(response.body) != null) {
        productos = jsonDecode(response.body)
            .map<ObtenerProductoModel>(
                (producto) => ObtenerProductoModel.fromJson(producto))
            .toList();
      }
      return productos;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> obtenerEstadoCategoriaRemoteDataSource(String estado) async {
    var url = Uri.parse("$host/comprador/busqueda/unestado/$estado");

    String estadoResponse = "";
    try {
      var response = await http.get(url);
      if (response.statusCode == 200 && jsonDecode(response.body) != null) {
        estadoResponse = jsonDecode(response.body)[0]["estado"];
      }

      return estadoResponse;
    } catch (e) {
      rethrow;
    }
  }
}
