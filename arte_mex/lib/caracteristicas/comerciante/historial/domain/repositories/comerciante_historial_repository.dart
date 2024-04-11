import '../../../../comprador/historial/domain/entities/comprador_historial_compra.dart';

abstract class ComercianteHistorialRepository{
  Future<List<CompradorHistorialCompra>> obtenerHistorialVentaRepository(String id);
}