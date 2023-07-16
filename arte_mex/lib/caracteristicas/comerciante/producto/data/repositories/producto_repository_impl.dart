import 'package:arte_mex/caracteristicas/comerciante/producto/data/datasource/producto_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/producto.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/repositories/producto_repository.dart';

import '../../domian/entities/obtener_producto.dart';

class ProductoRepositoryImpl implements ProductoRepository {
  final ProductoRemoteDataSource productoRemoteDataSource;
  ProductoRepositoryImpl({required this.productoRemoteDataSource});
  @override
  Future<void> crearProductoRepository(Producto producto) async {
    return await productoRemoteDataSource.crearProductoRemoteDataSource(producto);
  }

  @override
  Future<void> editarProductoRepository(String id, Producto producto) async {
    return await productoRemoteDataSource.editarProductoRemoteDataSource(id,producto);
  }

  @override
  Future<void> eliminarProductoRepository(String id) async {
    return await productoRemoteDataSource.eliminarProductoRemoteDataSource(id);
  }

  @override
  Future<List<ObtenerProducto>> extraerProductosRepository() async {
    return await productoRemoteDataSource.extraerProductosRemoteDataSource();
  }
}
