
import '../entities/carro.dart';

abstract class CompradorCarritoRepository {
  Future<List<Carro>> obtenerCarritoRepository(String id);
  Future<bool> eliminarProductoRepository(String id);
  Future<bool> agregarProductoCarritoRepository(String id, Carro carro);
}
