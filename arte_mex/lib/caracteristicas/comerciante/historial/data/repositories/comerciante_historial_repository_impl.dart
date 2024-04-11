import 'package:arte_mex/caracteristicas/comerciante/historial/data/datasource/comeciante_historial_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comerciante/historial/domain/repositories/comerciante_historial_repository.dart';

import '../../../../comprador/historial/domain/entities/comprador_historial_compra.dart';

class ComercianteHistorialRepositoryImpl
    implements ComercianteHistorialRepository {
  final ComercianteHistorialRemoteDataSource
      comercianteHistorialRemoteDataSource;
  ComercianteHistorialRepositoryImpl(
      {required this.comercianteHistorialRemoteDataSource});
  @override
  Future<List<CompradorHistorialCompra>> obtenerHistorialVentaRepository(
      String id) async {
    return await comercianteHistorialRemoteDataSource
        .obtenerHistorialVentaRemoteDataSource(id);
  }
}
