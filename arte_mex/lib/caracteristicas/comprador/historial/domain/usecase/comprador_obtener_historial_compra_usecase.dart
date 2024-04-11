import 'package:arte_mex/caracteristicas/comprador/historial/domain/repositories/comprador_historial_compra_repository.dart';

import '../entities/comprador_historial_compra.dart';

class CompradorObtenerHistorialCompraUsecase {
  final CompradorHistorialCompraRepository compradorHistorialCompraRepository;
  CompradorObtenerHistorialCompraUsecase(
      {required this.compradorHistorialCompraRepository});

  Future <List<CompradorHistorialCompra>> execute(String id) async {
    return await compradorHistorialCompraRepository.obtenerHistorialCompraRepository(id);
  }
}
