import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';

abstract class RegistroRepository {
  Future<bool> registrarCompradorRepository(Comprador comprador);
  Future<bool> registrarComercianteRepository(Comerciante comerciante);
}
