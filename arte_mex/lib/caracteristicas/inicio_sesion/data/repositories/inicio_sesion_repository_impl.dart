import 'package:arte_mex/caracteristicas/inicio_sesion/data/datasource/inicio_sesion_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/sesion.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/repositories/inicio_sesion_repository.dart';

class InicioSesionRepositoryImpl implements InicioSesionRepository {
  final InicioSesionRemoteDataSource inicioSesionRemoteDataSource;

  InicioSesionRepositoryImpl({required this.inicioSesionRemoteDataSource});
  @override
  Future<bool> iniciarSesionRepository(Sesion sesion) async {
    return await inicioSesionRemoteDataSource
        .iniciarSesionnRemoteDataSource(sesion);
  }
}
