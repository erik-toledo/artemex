import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/sesion.dart';

abstract class InicioSesionRepository{
  Future<bool>iniciarSesionRepository(Sesion sesion);
}