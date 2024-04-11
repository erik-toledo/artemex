import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/entities/direccion.dart';

import '../repositories/comprador_direccion_repository.dart';

class CompradorCrearDireccionUsecase {
  final CompradorDireccionRepository compradorDireccionRepository;
  CompradorCrearDireccionUsecase({required this.compradorDireccionRepository});

  Future<bool> execute(String id,Direccion direccion) async {
    return await compradorDireccionRepository
        .craearDireccionRepository(id,direccion);
  }
}
