import 'package:arte_mex/caracteristicas/inicio_sesion/domain/repositories/inicio_sesion_repository.dart';

import '../entities/sesion.dart';

class IniciarSesionUsecase {
  final InicioSesionRepository inicioSesionRepository;

  IniciarSesionUsecase({required this.inicioSesionRepository});

  Future<bool> execute(Sesion sesion) async {
    return await inicioSesionRepository.iniciarSesionRepository(sesion);
  }
}
