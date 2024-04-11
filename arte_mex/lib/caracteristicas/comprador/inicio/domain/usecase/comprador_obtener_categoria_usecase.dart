import 'package:arte_mex/caracteristicas/comprador/inicio/domain/repositories/comprador_categoria_repository.dart';

import '../entities/categoria.dart';

class CompradorObtenerCategoriaUsecase {
  final CompradorCategoriaRepository categoriaRepository;

  CompradorObtenerCategoriaUsecase({required this.categoriaRepository});

  Future<List<Categoria>> execute(String estado) async {
    return await categoriaRepository.obtenerCategoriaRepository(estado);
  }
}
