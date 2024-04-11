import 'package:arte_mex/caracteristicas/comprador/historial/domain/entities/comprador_historial_compra.dart';

abstract class ComercianteHistorialState {}

class ComercianteHistorialInicialState extends ComercianteHistorialState {}

class ComercianteObteniendoHistorialState extends ComercianteHistorialState {}

class ComercianteHistorialObtenidoState extends ComercianteHistorialState {
  final List<CompradorHistorialCompra> historial;
  ComercianteHistorialObtenidoState({required this.historial});
}

class ComercianteHistorialErrorState extends ComercianteHistorialState {
  final String error;
  ComercianteHistorialErrorState({required this.error});
}
