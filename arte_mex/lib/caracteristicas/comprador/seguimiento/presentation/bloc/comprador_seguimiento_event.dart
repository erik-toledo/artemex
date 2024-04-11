part of 'comprador_seguimiento_bloc.dart';

@immutable
abstract class CompradorSeguimientoEvent {}

class EventBotonObtenerSeguimiento extends CompradorSeguimientoEvent {
  final String idUsuario;
  EventBotonObtenerSeguimiento({required this.idUsuario});
}
