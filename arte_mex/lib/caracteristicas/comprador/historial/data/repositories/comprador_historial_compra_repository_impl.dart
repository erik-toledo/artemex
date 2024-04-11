import 'package:arte_mex/caracteristicas/comprador/historial/data/datasource/comprador_historial_compra_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comprador/historial/domain/repositories/comprador_historial_compra_repository.dart';

import '../../domain/entities/comprador_historial_compra.dart';

class CompradorHistorialCompraRepositoryImpl
    implements CompradorHistorialCompraRepository {
  CompradorHistorialCompraRemoteDataSource compraRepository;

  CompradorHistorialCompraRepositoryImpl({required this.compraRepository});
  @override
  Future<List<CompradorHistorialCompra>> obtenerHistorialCompraRepository(
      String id) async {
    return await compraRepository.obtenerHistorialCompraRemoteDataSource(id);
  }
}
