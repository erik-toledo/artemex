import '../repositories/producto_repository.dart';

class EliminarProductoUsecase {
  final ProductoRepository productoRepository;

  EliminarProductoUsecase({required this.productoRepository});

  Future<void> execute(String id) async {
    return await productoRepository.eliminarProductoRepository(id);
  }
}
