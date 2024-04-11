part of 'comprador_historial_bloc.dart';

@immutable
abstract class CompradorHistorialEvent {}

class EventBotonCompradorObtenerHistorial extends CompradorHistorialEvent {
  final String idComprador;
  EventBotonCompradorObtenerHistorial({required this.idComprador});
}
