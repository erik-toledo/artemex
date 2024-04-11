import 'package:arte_mex/caracteristicas/comprador/inicio/domain/repositories/comprador_categoria_repository.dart';

import '../entities/categoria.dart';

class CompradorObtenerCategoriasUsecase {
  final CompradorCategoriaRepository categoriaRepository;

  CompradorObtenerCategoriasUsecase({required this.categoriaRepository});

  Future<List<Categoria>> execute() async {
    return await categoriaRepository.obtenerCategoriasRepository();
  }
}
