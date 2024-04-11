part of 'comprador_direccion_bloc.dart';

@immutable
abstract class CompradorDireccionState {}

class CompradorDireccionInicial extends CompradorDireccionState {}

class CompradorObteniendoDireccionState extends CompradorDireccionState {}

class CompradorDireccionObtenidaState extends CompradorDireccionState {
  final List<Direccion> direcciones;
  CompradorDireccionObtenidaState({required this.direcciones});
}

class CompradorDireccionErrorState extends CompradorDireccionState {
  final String error;
  CompradorDireccionErrorState({required this.error});
}
