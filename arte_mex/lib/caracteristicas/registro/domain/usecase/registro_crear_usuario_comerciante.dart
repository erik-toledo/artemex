import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';
import 'package:arte_mex/caracteristicas/registro/domain/repositories/registro_repository.dart';

class RegistroCrearUsuarioComerciante {
  final RegistroRepository registroRepository;
  RegistroCrearUsuarioComerciante({required this.registroRepository});
  Future<bool> execute(Comerciante comerciante) async {
    return await registroRepository.registrarComercianteRepository(comerciante);
  }
}
