import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/producto.dart';

import '../../domian/entities/obtener_producto.dart';

abstract class ProductoRemoteDataSource {
  Future<void> crearProductoRemoteDataSource(Producto producto);
  Future<void> editarProductoRemoteDataSource(String id, Producto producto);
  Future<void> eliminarProductoRemoteDataSource(String id);
  Future<List<ObtenerProducto>> extraerProductosRemoteDataSource();
}

class ProductoRemoteDataSourceImpl implements ProductoRemoteDataSource {
  @override
  Future<void> crearProductoRemoteDataSource(Producto producto) async {}

  @override
  Future<void> editarProductoRemoteDataSource(
      String id, Producto producto) async {}

  @override
  Future<void> eliminarProductoRemoteDataSource(String id) async {}

  @override
  Future<List<ObtenerProducto>> extraerProductosRemoteDataSource() async {
    throw UnimplementedError();
  }
}
