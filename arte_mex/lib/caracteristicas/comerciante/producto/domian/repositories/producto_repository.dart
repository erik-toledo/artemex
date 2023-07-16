import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/producto.dart';

abstract class ProductoRepository {
  Future<void>crearProductoRepository(Producto producto);
  Future<void> editarProductoRepository(String id, Producto producto);
  Future<void> eliminarProductoRepository(String id);
  Future<List<ObtenerProducto>> extraerProductosRepository();
}
