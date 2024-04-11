import 'package:arte_mex/caracteristicas/comprador/direcciones/data/datasource/comprador_direccion_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/entities/direccion.dart';
import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/repositories/comprador_direccion_repository.dart';

class CompradorDireccionRepositoryImpl implements CompradorDireccionRepository {
  final CompradorDireccionRemoteDataSource compradorDireccionRemoteDataSource;
  CompradorDireccionRepositoryImpl(
      {required this.compradorDireccionRemoteDataSource});
  @override
  Future<bool> actualizarDireccionRepository(
      String idUsuario, Direccion direccion) async {
    return await compradorDireccionRemoteDataSource
        .actualizarDireccionRemoteDataSource(idUsuario, direccion);
  }

  @override
  Future<bool> craearDireccionRepository(String id,Direccion direccion) async {
    return await compradorDireccionRemoteDataSource
        .craearDireccionRemoteDataSource(id,direccion);
  }

  @override
  Future<bool> eliminarDireccionRepository(String idUsuario) async {
    return await compradorDireccionRemoteDataSource
        .eliminarDireccionRemoteDataSource(idUsuario);
  }

  @override
  Future<List<Direccion>> obtenerDireccionRepository(String idUsuario) async {
    return await compradorDireccionRemoteDataSource
        .obtenerDireccionRemoteDataSource(idUsuario);
  }
}
