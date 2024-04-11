import 'package:arte_mex/caracteristicas/comerciante/inicio/domain/repositories/comerciante_inicio_repository.dart';

class ComercianteEnviosPendientesUsecase{
  final ComercianteInicioRepository comercianteInicioRepository;
ComercianteEnviosPendientesUsecase({required this.comercianteInicioRepository});

Future<void> execute(String id)async{
  return await comercianteInicioRepository.extraerEnviosPendientesRepository(id);
}

}