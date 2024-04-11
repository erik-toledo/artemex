import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';

import '../repositories/registro_repository.dart';

class RegistroCrearUsuarioComprador {
  final RegistroRepository registroRepository;
  RegistroCrearUsuarioComprador({required this.registroRepository});

  Future<bool> execute(Comprador comprador) async {
    return await registroRepository.registrarCompradorRepository(comprador);
  }
}
