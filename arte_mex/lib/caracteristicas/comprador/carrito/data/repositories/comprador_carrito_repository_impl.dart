import 'package:arte_mex/caracteristicas/comprador/carrito/data/datasource/comprador_carrito_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comprador/carrito/domain/repositories/comprador_carrito_repository.dart';

import '../../domain/entities/carro.dart';

class CompradorCarritoRepositoryImpl implements CompradorCarritoRepository {
  CompradorCarritoRemoteDataSource carritoRemoteDataSource;
  CompradorCarritoRepositoryImpl({required this.carritoRemoteDataSource});
  @override
  Future<bool> agregarProductoCarritoRepository(
      String id, Carro carro) async {
    return await carritoRemoteDataSource.agregarProductoCarritoRemoteDataSource(id,carro);
  }

  @override
  Future<bool> eliminarProductoRepository(String id) async{
    return await carritoRemoteDataSource.eliminarProductoRemoteDataSource(id);
  }

  @override
  Future<List<Carro>> obtenerCarritoRepository(String id)async {
   
    return await carritoRemoteDataSource.obtenerCarritoRemoteDataSource(id);
  }
}
