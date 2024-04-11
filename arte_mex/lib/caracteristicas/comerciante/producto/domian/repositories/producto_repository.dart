import 'dart:io';

import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/producto.dart';

abstract class ProductoRepository {
  Future<bool> crearProductoRepository(Producto producto);
  Future<bool> editarProductoRepository(String id, Producto producto);
  Future<void> eliminarProductoRepository(String id);
  Future<List<ObtenerProducto>> extraerProductosRepository(String id);
  Future<String> subirImagenRepository(File image);
}
