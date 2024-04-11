part of 'registro_comprador_bloc.dart';

@immutable
abstract class RegistroCompradorState {}

class RegistroCompradorInicial extends RegistroCompradorState {}

class RegistroRegistrandoCompradorState extends RegistroCompradorState {}

class RegistroCompradorRegistradoState extends RegistroCompradorState {
  final Widget inicioSesion;
  final bool respuesta;
  RegistroCompradorRegistradoState(
      {required this.inicioSesion, required this.respuesta});
}

class RegistroCompradorErrorState extends RegistroCompradorState {
  final String error;
  RegistroCompradorErrorState({required this.error});
}
