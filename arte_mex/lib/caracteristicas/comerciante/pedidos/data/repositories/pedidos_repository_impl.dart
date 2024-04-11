import 'package:arte_mex/caracteristicas/comerciante/pedidos/data/datasource/pedidos_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comerciante/pedidos/domain/repositories/pedidos_repository.dart';

import '../../domain/entities/pedido.dart';

class PedidosRepositoryImpl implements PedidosRepository {
  final PedidosRemoteDataSource pedidosRemoteDataSource;

  PedidosRepositoryImpl({required this.pedidosRemoteDataSource});

  @override
  Future<List<Pedido>> obtenerPedidosRepository(String id) async {
    return await pedidosRemoteDataSource.obtenerPedidosRemoteDataSource(id);
  }

  @override
  Future<bool> actualizarEstatusPedidoRepository(
      String id, String estatus, String empresa) async {
    return await pedidosRemoteDataSource
        .actualizarEstatusPedidoRemoteDataSource(id, estatus, empresa);
  }
}
