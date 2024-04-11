import '../repositories/pedidos_repository.dart';

class ActualizarEstatusPedidoUsecase {
  final PedidosRepository pedidosRepository;
  ActualizarEstatusPedidoUsecase({required this.pedidosRepository});

  Future<bool> execute(String id, String estatus, String empresa) async {
    return await pedidosRepository.actualizarEstatusPedidoRepository(
        id, estatus, empresa);
  }
}
