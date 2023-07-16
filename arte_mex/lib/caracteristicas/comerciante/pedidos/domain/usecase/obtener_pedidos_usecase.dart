import 'package:arte_mex/caracteristicas/comerciante/pedidos/domain/repositories/pedidos_repository.dart';

class ObtenerPedidosUsecase {
  final PedidosRepository pedidosRepository;
  ObtenerPedidosUsecase({required this.pedidosRepository});

  Future<void> execute(String id)async {
    return await pedidosRepository.obtenerPedidosRepository(id);
  } 
}
