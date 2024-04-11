import '../repositories/comprador_carrito_repository.dart';

class CompradorEliminarProductoCarritoUsecase {
  final CompradorCarritoRepository compradorCarritoRepository;
  CompradorEliminarProductoCarritoUsecase(
      {required this.compradorCarritoRepository});

  Future<bool> execute(String id) async {
    return await compradorCarritoRepository.eliminarProductoRepository(id);
  }
}
