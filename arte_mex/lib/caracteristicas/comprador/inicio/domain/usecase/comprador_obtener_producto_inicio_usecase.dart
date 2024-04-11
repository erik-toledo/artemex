import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';

import '../repositories/comprador_categoria_repository.dart';

class CompradorObtenerProductoInicioUsecase {
  final CompradorCategoriaRepository categoriaRepository;
  CompradorObtenerProductoInicioUsecase({required this.categoriaRepository});

  Future<List<ObtenerProducto>> execute() async {
    return await categoriaRepository.obtenerProductosInicioRepository();
  }
}
