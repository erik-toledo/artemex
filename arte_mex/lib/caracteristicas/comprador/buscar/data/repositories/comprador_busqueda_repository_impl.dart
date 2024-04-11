import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/comprador/buscar/data/datasource/comprador_busqueda_remote_data_source.dart';
import 'package:arte_mex/caracteristicas/comprador/buscar/domain/repositories/comprador_busqueda_repository.dart';


class CompradorBusquedaRepositoryImpl implements CompradorBusquedaRepository {
  CompradorBusquedaRemoteDataSource compradorBusquedaRemoteDataSource;
  CompradorBusquedaRepositoryImpl(
      {required this.compradorBusquedaRemoteDataSource});
  @override
  Future<List<ObtenerProducto>> busquedaRepository(String producto) async {
    return await compradorBusquedaRemoteDataSource
        .busquedaRemoteDataSource(producto);
  }
}
