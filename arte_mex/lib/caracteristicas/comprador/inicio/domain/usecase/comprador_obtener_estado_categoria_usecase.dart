import 'package:arte_mex/caracteristicas/comprador/inicio/domain/repositories/comprador_categoria_repository.dart';

class CompradorObtenerEstadoCategoriaUsecase {
  final CompradorCategoriaRepository categoriaRepository;

  CompradorObtenerEstadoCategoriaUsecase({required this.categoriaRepository});

  Future<String> execute(String categoria) async {
    return await categoriaRepository.obtenerEstadoCategoriaRepository(categoria);
  }
}
