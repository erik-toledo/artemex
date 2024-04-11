import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comerciante.dart';
import 'package:arte_mex/caracteristicas/inicio_sesion/domain/entities/comprador.dart';
import 'package:arte_mex/caracteristicas/registro/data/datasource/registro_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/registro/domain/repositories/registro_repository.dart';

class RegistroRepositoryImpl implements RegistroRepository {
  final RegistroRemoteDataSource registroRemoteDataSource;
  RegistroRepositoryImpl({required this.registroRemoteDataSource});
  @override
  Future<bool> registrarComercianteRepository(Comerciante comerciante) async {
    return await registroRemoteDataSource
        .registrarComercianteDataSource(comerciante);
  }

  @override
  Future<bool> registrarCompradorRepository(Comprador comprador) async {
    return await registroRemoteDataSource
        .registrarCompradorDataSource(comprador);
  }
}
