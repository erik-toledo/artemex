import 'package:arte_mex/caracteristicas/registro/domain/usecase/registro_crear_usuario_comprador.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../inicio_sesion/domain/entities/comprador.dart';
part 'registro_comprador_estate.dart';
part 'registro_comprador_event.dart';

class RegistroCompradorBloc
    extends Bloc<RegistroCompradorEvent, RegistroCompradorState> {
  final RegistroCrearUsuarioComprador registroCrearUsuarioComprador;

  Future<bool> registrarComprador(Comprador comprador) async {
    try {
      return await registroCrearUsuarioComprador.execute(comprador);
    } catch (e) {
      rethrow;
    }
  }

  RegistroCompradorBloc({required this.registroCrearUsuarioComprador})
      : super(RegistroCompradorInicial()) {
    on<RegistroCompradorEvent>((event, emit) async {});
  }
}
