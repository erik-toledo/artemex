part of 'comprador_carrito_bloc.dart';

@immutable
abstract class CompradorCarritoEvent {}

class EventBotonObtenerCarro extends CompradorCarritoEvent {
  final String idUsuario;
  EventBotonObtenerCarro({required this.idUsuario, });
}
