import 'package:arte_mex/caracteristicas/comprador/direcciones/domain/entities/direccion.dart';

abstract class CompradorDireccionRepository {
  Future<bool> craearDireccionRepository(String id, Direccion direccion);
  Future<bool> eliminarDireccionRepository(String idUsuario);
  Future<bool> actualizarDireccionRepository(
      String idUsuario, Direccion direccion);
  Future<List<Direccion>> obtenerDireccionRepository(String idUsuario);
}
