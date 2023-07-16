import '../entities/producto.dart';
import '../repositories/producto_repository.dart';

class ActualizarProductoUsecase{
  final ProductoRepository productoRepository;

  ActualizarProductoUsecase({required this.productoRepository});

  Future<void> execute(String id,Producto producto) async {
    return await productoRepository.editarProductoRepository(id, producto);
  }
}