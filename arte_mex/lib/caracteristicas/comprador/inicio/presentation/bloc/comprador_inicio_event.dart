part of 'comprador_inicio_bloc.dart';

@immutable
abstract class CompradorIncioEvent {}

class EventBotonObtenerArticulos extends CompradorIncioEvent {}

class EventBotonObtenerCategorias extends CompradorIncioEvent {
  final String estado;
  EventBotonObtenerCategorias({required this.estado});
}

class EventBotonObtenerProductosCategorias extends CompradorIncioEvent {
  final String categoria;
  EventBotonObtenerProductosCategorias({required this.categoria});
}

class EventBotonReiniciarEvent extends CompradorIncioEvent {}
