import 'package:arte_mex/caracteristicas/comerciante/verificacion/domain/entitites/verificacion.dart';

abstract class ComercianteVerificacionRepository{
  Future<void> solicitarVerificacionRepository(Verificacion verificacion);
}