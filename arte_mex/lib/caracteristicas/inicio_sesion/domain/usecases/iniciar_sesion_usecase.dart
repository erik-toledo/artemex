import 'package:arte_mex/caracteristicas/inicio_sesion/domain/repositories/inicio_sesion_repository.dart';

class IniciarSesionUsecase {
  final InicioSesionRepository inicioSesionRepository;

  IniciarSesionUsecase({required this.inicioSesionRepository});

  Future<bool> execute(String correo,String contrasena)async {
    return await inicioSesionRepository.iniciarSesionRepository(correo,contrasena);
  }
}
