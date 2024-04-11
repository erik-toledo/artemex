part of 'registro_comerciante_bloc.dart';

@immutable
abstract class RegistroComercianteEvent {}

class BotonRegistroComercianteEvent extends RegistroComercianteEvent {
  final Comerciante comerciante;
  BotonRegistroComercianteEvent({required this.comerciante});
}

class RegistroComercianteReinicioEvent extends RegistroComercianteEvent {}
