part of 'comprador_historial_bloc.dart';

@immutable
abstract class CompradorHistorialState {}

class CompradorHistorialInicialState extends CompradorHistorialState {}

class CompradorHistorialObteniendoHistorial extends CompradorHistorialState {}

class CompradorHistorialObtenidoState extends CompradorHistorialState {
  final List<CompradorHistorialCompra> historial;
  CompradorHistorialObtenidoState({required this.historial});
}

class CompradorHistorialErrorState extends CompradorHistorialState {
  final String error;
  CompradorHistorialErrorState({required this.error});
}
