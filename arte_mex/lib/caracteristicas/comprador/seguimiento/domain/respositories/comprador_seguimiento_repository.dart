import '../../../comprar/domain/entities/compra.dart';

abstract class CompradorSeguimientoRepository{
  Future<List<Compra>> seguimientoCompra(String idCompra);
}