import 'package:arte_mex/caracteristicas/inicio_sesion/data/datasource/inicio_sesion_local_data.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/repositories/inicio_sesion_local_informacion_repository.dart';

class InicioSesionLocalInformacionRepositoryImpl
    implements InicioSesionLocalInformacionRepository {
  InicioSesionLocalDataImpl localDataImpl;
  InicioSesionLocalInformacionRepositoryImpl({required this.localDataImpl});
  @override
  Future<Object> obtenerInformacionUsuarioRepository() async {
    return await localDataImpl.informacionUsuario();
  }
}
