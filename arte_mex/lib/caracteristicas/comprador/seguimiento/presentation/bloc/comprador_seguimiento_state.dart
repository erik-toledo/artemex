part of 'comprador_seguimiento_bloc.dart';

@immutable
abstract class CompradorSeguimientoState {}

class CompradorSeguimientoInicialState extends CompradorSeguimientoState {}

class CompradorObteniendoSeguimientoState extends CompradorSeguimientoState {}

class CompradorSeguimientoObtenidoState extends CompradorSeguimientoState {
  final List<Compra> seguimiento;
  CompradorSeguimientoObtenidoState({required this.seguimiento});
}

class CompradorSeguimientoError extends CompradorSeguimientoState {
  final String error;
  CompradorSeguimientoError({required this.error});
}
