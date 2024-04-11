import '../entities/comprador_historial_compra.dart';

abstract class CompradorHistorialCompraRepository{

  Future<List<CompradorHistorialCompra>> obtenerHistorialCompraRepository(String id);
}