part of 'comprador_direccion_bloc.dart';

@immutable
abstract class CompradorDireccionEvent {}



class EventBotonObtenerDireccion extends CompradorDireccionEvent {
  final String idUsuario;
  EventBotonObtenerDireccion({required this.idUsuario});
}
