import 'package:arte_mex/caracteristicas/comerciante/producto/domian/repositories/producto_repository.dart';

import '../entities/producto.dart';

class CrearProductoUsecase {
  final ProductoRepository productoRepository;

  CrearProductoUsecase({required this.productoRepository});

  Future<bool> execute(Producto producto) async {
    return await productoRepository.crearProductoRepository(producto);
  }
}
