import 'package:arte_mex/caracteristicas/comerciante/verificacion/domain/entitites/verificacion.dart';

abstract class ComercianteVerificacionRemoteDataSource {
  Future<void> solicitarVerificacionRemoteDataSource(Verificacion verificacion);
}

class ComercianteVerificacionRemoteDataSourceImpl
    implements ComercianteVerificacionRemoteDataSource {
  @override
  Future<void> solicitarVerificacionRemoteDataSource(
      Verificacion verificacion) {
    throw UnimplementedError();
  }
}
