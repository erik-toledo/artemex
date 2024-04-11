part of 'comerciante_producto_bloc.dart';

@immutable
abstract class ComercianteProductoState {}

class ComercianteProductoInicialState extends ComercianteProductoState {}

class ComercianteCargandoState extends ComercianteProductoState {}

class ComercianteProductoEliminadoState extends ComercianteProductoState {}

class ComercianteProductoCargadoState extends ComercianteProductoState {
  final List<ObtenerProducto> productos;
  ComercianteProductoCargadoState({required this.productos});
}

class ComercianteProductoError extends ComercianteProductoState {
  final String error;

  ComercianteProductoError({required this.error});
}
