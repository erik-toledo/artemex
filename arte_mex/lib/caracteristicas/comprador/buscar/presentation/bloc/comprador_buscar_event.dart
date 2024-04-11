part of 'comprador_buscar_bloc.dart';

@immutable
abstract class CompradorBuscarEvent {}

class EventBotonBuscar extends CompradorBuscarEvent {
  final String criterio;
  EventBotonBuscar({required this.criterio});
}

class EvenBotonReiniciar extends CompradorBuscarEvent {}
