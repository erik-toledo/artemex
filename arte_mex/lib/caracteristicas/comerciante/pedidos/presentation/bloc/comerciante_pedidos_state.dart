part of 'comerciante_pedidos_bloc.dart';

@immutable
abstract class ComerciantePedidosState {}

class ComerciantePedidosInicialState extends ComerciantePedidosState {}

class ComercianteObteniendoPedidosState extends ComerciantePedidosState {}

class ComerciantePedidosObtenidosState extends ComerciantePedidosState {
  final List<Pedido> pedidos;
  ComerciantePedidosObtenidosState({required this.pedidos});
}

class ComercianteErrorPedidosState extends ComerciantePedidosState {
  final String error;
  ComercianteErrorPedidosState({required this.error});
}
