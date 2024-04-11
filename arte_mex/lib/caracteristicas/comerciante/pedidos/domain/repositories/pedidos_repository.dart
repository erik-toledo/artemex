
import '../entities/pedido.dart';

abstract class PedidosRepository {
  Future<List<Pedido>> obtenerPedidosRepository(String id);
  Future<bool> actualizarEstatusPedidoRepository(
      String id, String estatus, String empresa);

}
