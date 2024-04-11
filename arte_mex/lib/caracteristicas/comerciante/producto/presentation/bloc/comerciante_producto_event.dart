part of 'comerciante_producto_bloc.dart';

@immutable
abstract class ComercianteProductoEvent {}

class EventBotonObtenerProducto extends ComercianteProductoEvent {
  final String idUsuario;
  EventBotonObtenerProducto({required this.idUsuario});
}

class EventBotonEliminarProducto extends ComercianteProductoEvent {
  final String idProducto;
  EventBotonEliminarProducto({required this.idProducto});
}


