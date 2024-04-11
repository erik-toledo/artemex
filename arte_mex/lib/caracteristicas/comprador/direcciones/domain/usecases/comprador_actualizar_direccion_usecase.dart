import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/entities/direccion.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/repositories/comprador_direccion_repository.dart';

class CompradorActualizarDireccionUsecase{
  final CompradorDireccionRepository compradorDireccionRepository;
  CompradorActualizarDireccionUsecase({required this.compradorDireccionRepository});

  Future<bool>execute(String id, Direccion direccion)async{
    return await compradorDireccionRepository.actualizarDireccionRepository(id, direccion);
  }
}