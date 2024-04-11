import 'package:arte_mex/caracteristicas/comprador/carrito/domain/repositories/comprador_carrito_repository.dart';
import '../entities/carro.dart';

class CompradorAgregarProductoCarritoUsecase {
  final CompradorCarritoRepository compradorCarritoRepository;

  CompradorAgregarProductoCarritoUsecase(
      {required this.compradorCarritoRepository});

  Future<bool> execute(String id, Carro carro) async {
    return await compradorCarritoRepository.agregarProductoCarritoRepository(
        id, carro);
  }
}
