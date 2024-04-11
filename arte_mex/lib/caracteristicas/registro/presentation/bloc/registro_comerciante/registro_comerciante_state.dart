part of 'registro_comerciante_bloc.dart';

@immutable
abstract class RegistroComercianteState {}

class RegistroComercianteinicialState extends RegistroComercianteState {}

class RegistroComercianteRegistrandoState extends RegistroComercianteState {}

class RegistroComercianteRegistradoState extends RegistroComercianteState {
  final Widget inicioSesion;
  final bool respuesta;
  RegistroComercianteRegistradoState({required this.inicioSesion,required this.respuesta});
}
class RegistroComercianteErrorState extends RegistroComercianteState {
  final String error;
  RegistroComercianteErrorState({required this.error});
}
