abstract class PedidosRemoteDataSource {
  Future<void> obtenerPedidosRemoteDataSource(String id);
}

class PedidosRemoteDataSourceImpl implements PedidosRemoteDataSource {
  @override
  Future<void> obtenerPedidosRemoteDataSource(String id) {
    throw UnimplementedError();
  }
}
