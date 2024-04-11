
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/repositories/inicio_sesion_local_informacion_repository.dart';

class InicioSesionObtenerInformacionUsuarioUsecase {
  final InicioSesionLocalInformacionRepository informacionRepository;
  InicioSesionObtenerInformacionUsuarioUsecase(
      {required this.informacionRepository});

  Future<Object> execute() async {
    return await informacionRepository.obtenerInformacionUsuarioRepository();
  }
}
