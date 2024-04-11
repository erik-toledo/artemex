import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';

import '../entities/categoria.dart';

abstract class CompradorCategoriaRepository {
  Future<List<Categoria>> obtenerCategoriaRepository(String estado);
  Future<List<Categoria>> obtenerCategoriasRepository();
  Future<List<ObtenerProducto>> obtenerProductosCategoriasRepository(String categoria);
  Future<String> obtenerEstadoCategoriaRepository(
      String categoria);


  Future<List<ObtenerProducto>> obtenerProductosInicioRepository();
}
