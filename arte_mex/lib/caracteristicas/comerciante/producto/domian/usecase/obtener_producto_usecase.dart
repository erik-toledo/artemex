import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';

import '../repositories/producto_repository.dart';

class ObtenerProductoUsecase {
  final ProductoRepository productoRepository;

  ObtenerProductoUsecase({required this.productoRepository});

  Future<List<ObtenerProducto>> execute(String id) async {
    return await productoRepository.extraerProductosRepository();
  }
}
