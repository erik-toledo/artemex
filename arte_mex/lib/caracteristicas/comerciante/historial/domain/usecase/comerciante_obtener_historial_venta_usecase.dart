import 'package:arte_mex/caracteristicas/comerciante/historial/domain/repositories/comerciante_historial_repository.dart';

import '../../../../comprador/historial/domain/entities/comprador_historial_compra.dart';

class ComercianteObtenerHistorialVentaUsecase {
  final ComercianteHistorialRepository comercianteHistorialRepository;
  ComercianteObtenerHistorialVentaUsecase(
      {required this.comercianteHistorialRepository});

  Future<List<CompradorHistorialCompra>> execute(String id) async {
    return await comercianteHistorialRepository
        .obtenerHistorialVentaRepository(id);
  }
}
