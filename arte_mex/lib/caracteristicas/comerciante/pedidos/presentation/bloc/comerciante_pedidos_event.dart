part of 'comerciante_pedidos_bloc.dart';

@immutable
abstract class ComerciantePedidosEvent {}

class EventBotonObtenerPedidos extends ComerciantePedidosEvent {
  final String idUsuario;

  EventBotonObtenerPedidos({required this.idUsuario});
}
