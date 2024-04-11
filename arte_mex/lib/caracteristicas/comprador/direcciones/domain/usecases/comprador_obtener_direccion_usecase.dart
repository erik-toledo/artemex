import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/entities/direccion.dart';

import '../repositories/comprador_direccion_repository.dart';

class CompradorObtenerDireccionUsecase {
  final CompradorDireccionRepository compradorDireccionRepository;

  CompradorObtenerDireccionUsecase(
      {required this.compradorDireccionRepository});

  Future<List<Direccion>> execute(String id) async {
    return await compradorDireccionRepository.obtenerDireccionRepository(id);
  }
}
