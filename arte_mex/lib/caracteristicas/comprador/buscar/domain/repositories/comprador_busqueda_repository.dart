import '../../../../comerciante/producto/domian/entities/obtener_producto.dart';

abstract class CompradorBusquedaRepository {
  Future<List<ObtenerProducto>> busquedaRepository(String producto);
}
