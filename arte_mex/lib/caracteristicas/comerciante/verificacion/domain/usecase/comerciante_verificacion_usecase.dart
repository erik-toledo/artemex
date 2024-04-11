import 'package:arte_mex/caracteristicas/comerciante/verificacion/domain/entitites/verificacion.dart';
import 'package:arte_mex/caracteristicas/comerciante/verificacion/domain/repositories/comerciante_verificacion_repository.dart';

class ComercianteVerificacionUsecase {
  final ComercianteVerificacionRepository comercianteVerificacionRepository;
  ComercianteVerificacionUsecase(
      {required this.comercianteVerificacionRepository});

  Future<void> execute(Verificacion verificacion) async {
    return await comercianteVerificacionRepository
        .solicitarVerificacionRepository(verificacion);
  }
}
