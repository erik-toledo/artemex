import 'package:arte_mex/caracteristicas/comprador/seguimiento/data/datasource/comprador_seguimiento_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comprador/seguimiento/domain/respositories/comprador_seguimiento_repository.dart';

import '../../../comprar/domain/entities/compra.dart';

class CompradorSeguimientoRepositoryImpl
    implements CompradorSeguimientoRepository {
  CompradorSeguimientoRemoteDataSource compradorSeguimientoRemoteDataSource;
  CompradorSeguimientoRepositoryImpl(
      {required this.compradorSeguimientoRemoteDataSource});
  @override
  Future<List<Compra>> seguimientoCompra(String idCompra) async {
    return await compradorSeguimientoRemoteDataSource
        .seguimientoCompra(idCompra);
  }
}
