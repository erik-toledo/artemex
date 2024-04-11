import 'package:arte_mex/caracteristicas/comprador/seguimiento/domain/respositories/comprador_seguimiento_repository.dart';

import '../../../comprar/domain/entities/compra.dart';

class CompradorSeguimientoUsecase {
  final CompradorSeguimientoRepository compradorSeguimientoRepository;

  CompradorSeguimientoUsecase({required this.compradorSeguimientoRepository});

  Future<List<Compra>> excute(String id) async {
    return await compradorSeguimientoRepository.seguimientoCompra(id);
  }
}
