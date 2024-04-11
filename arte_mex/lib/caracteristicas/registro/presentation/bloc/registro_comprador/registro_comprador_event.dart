part of 'registro_comprador_bloc.dart';

@immutable
abstract class RegistroCompradorEvent {}

class BotonRegistroComprador extends RegistroCompradorEvent {
  final Comprador comprador;
  BotonRegistroComprador({required this.comprador});
}

class RegistroCompradorReinicioEvent extends RegistroCompradorEvent {}
