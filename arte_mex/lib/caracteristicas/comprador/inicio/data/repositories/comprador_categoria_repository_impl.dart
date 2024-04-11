import 'package:arte_mex/caracteristicas/comerciante/producto/domian/entities/obtener_producto.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/data/datasource/comprador_categoria_remote_data_sorce.dart';
import 'package:arte_mex/caracteristicas/comprador/inicio/domain/repositories/comprador_categoria_repository.dart';

import '../../domain/entities/categoria.dart';

class CompradorCategoriaRepositoryImpl implements CompradorCategoriaRepository {
  CompradorCategoriaRemoteDataSource categoriaRemoteDataSource;
  CompradorCategoriaRepositoryImpl({required this.categoriaRemoteDataSource});
  @override
  Future<List<Categoria>> obtenerCategoriaRepository(String estado) async {
    return await categoriaRemoteDataSource
        .obtenerCategoriaRemoteDataSource(estado);
  }

  @override
  Future<List<ObtenerProducto>> obtenerProductosInicioRepository() async {
    return await categoriaRemoteDataSource
        .obtenerProductosInicioRemoteDataSource();
  }

  @override
  Future<List<Categoria>> obtenerCategoriasRepository() async {
    return await categoriaRemoteDataSource.obtenerCategoriasRemoteDataSource();
  }

  @override
  Future<List<ObtenerProducto>> obtenerProductosCategoriasRepository(
      String categoria) async {
    return await categoriaRemoteDataSource
        .obtenerProductosCategoriasRemoteDataSource(categoria);
  }

  @override
  Future<String> obtenerEstadoCategoriaRepository(String estado) async {
    return await categoriaRemoteDataSource
        .obtenerEstadoCategoriaRemoteDataSource(estado);
  }
}
