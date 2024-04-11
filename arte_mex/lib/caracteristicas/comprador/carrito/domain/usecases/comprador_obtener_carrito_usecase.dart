import '../entities/carro.dart';
import '../repositories/comprador_carrito_repository.dart';

class CompradorObtenerCarritoUsecase {
  final CompradorCarritoRepository compradorCarritoRepository;
  CompradorObtenerCarritoUsecase({required this.compradorCarritoRepository});

  Future<List<Carro>> execute(String id) async {
    return await compradorCarritoRepository.obtenerCarritoRepository(id);
  }
}
