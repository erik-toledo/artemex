import '../repositories/comprador_direccion_repository.dart';

class CompradorEliminarDireccionUsecase {
  final CompradorDireccionRepository compradorDireccionRepository;
  CompradorEliminarDireccionUsecase(
      {required this.compradorDireccionRepository});

  Future<bool> execute(String id) async {
    return await compradorDireccionRepository.eliminarDireccionRepository(id);
  }
}
