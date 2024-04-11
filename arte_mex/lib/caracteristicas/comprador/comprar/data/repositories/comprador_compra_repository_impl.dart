import 'package:arte_mex/caracteristicas/comprador/comprar/data/datasource/comprador_compra_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comprador/comprar/domain/repositories/comprador_compra_repository.dart';

class CompradorCompraRepositoryImpl implements CompradorCompraRepository {
  CompradorCompraRemoteDataSource compraRemoteDataSource;
  CompradorCompraRepositoryImpl({required this.compraRemoteDataSource});
  @override
  Future<bool> crearCompraRepository(String idUsuario,String direccion) async {
    return await compraRemoteDataSource.crearCompraRemoteDataSource(idUsuario,direccion);
  }
}
