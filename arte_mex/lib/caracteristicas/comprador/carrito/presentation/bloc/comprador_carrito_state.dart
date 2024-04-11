part of 'comprador_carrito_bloc.dart';

@immutable
abstract class CompradorCarritoState {}

class CompradorCarritoInicial extends CompradorCarritoState {}

class CompradorObteniendoCarritoState extends CompradorCarritoState {}

class CompradorCarritoObtenidoState extends CompradorCarritoState {
  final List<Carro> carro;
  CompradorCarritoObtenidoState({required this.carro});
}

class CompradorCarritoError extends CompradorCarritoState {
  final String error;
  CompradorCarritoError({required this.error});
}
