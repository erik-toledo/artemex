import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';

import '../repositories/comprador_categoria_repository.dart';

class CompradorObtenerPrudctoCategoriaInicioUsecase {
  final CompradorCategoriaRepository categoriaRepository;
  CompradorObtenerPrudctoCategoriaInicioUsecase({required this.categoriaRepository});

  Future<List<ObtenerProducto>> execute(String categoria) async {
    return await categoriaRepository
        .obtenerProductosCategoriasRepository(categoria);
  }
}
