import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/comprador/buscar/domain/repositories/comprador_busqueda_repository.dart';


class CompradorBusquedaUsease {
  final CompradorBusquedaRepository compradorBusquedaRepository;
  CompradorBusquedaUsease({required this.compradorBusquedaRepository});

  Future<List<ObtenerProducto>> execute(String producto) async {
    return await compradorBusquedaRepository.busquedaRepository(producto);
  }
}
