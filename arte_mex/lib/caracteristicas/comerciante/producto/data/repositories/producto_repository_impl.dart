import 'dart:io';

import 'package:arte_mex/caracteristicas/comerciante/producto/data/datasource/producto_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/producto.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/repositories/producto_repository.dart';

import '../../domian/entities/obtener_producto.dart';

class ProductoRepositoryImpl implements ProductoRepository {
  final ProductoRemoteDataSource productoRemoteDataSource;
  ProductoRepositoryImpl({required this.productoRemoteDataSource});
  @override
  Future<bool> crearProductoRepository(Producto producto) async {
    return await productoRemoteDataSource
        .crearProductoRemoteDataSource(producto);
  }

  @override
  Future<bool> editarProductoRepository(String id, Producto producto) async {
    return await productoRemoteDataSource.editarProductoRemoteDataSource(
        id, producto);
  }

  @override
  Future<void> eliminarProductoRepository(String id) async {
    return await productoRemoteDataSource.eliminarProductoRemoteDataSource(id);
  }

  @override
  Future<List<ObtenerProducto>> extraerProductosRepository(String id) async {
    return await productoRemoteDataSource.extraerProductosRemoteDataSource(id);
  }

  @override
  Future<String> subirImagenRepository(File file) async {
    return await productoRemoteDataSource.subirImagenRemoteDataSource(file);
  }
  
  
}
