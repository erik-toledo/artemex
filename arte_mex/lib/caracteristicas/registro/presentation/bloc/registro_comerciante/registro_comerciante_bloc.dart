import 'package:arte_mex/caracteristicas/registro/domain/usecase/registro_crear_usuario_comerciante.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../inicio_sesion/domain/entities/comerciante.dart';

part 'registro_comerciante_event.dart';
part 'registro_comerciante_state.dart';

class RegistroComercianteBloc
    extends Bloc<RegistroComercianteEvent, RegistroComercianteState> {
  final RegistroCrearUsuarioComerciante registroCrearUsuarioComerciante;

  Future<bool> registrarComerciante(Comerciante comerciante) async {
    try {
      return await registroCrearUsuarioComerciante.execute(comerciante);
    } catch (e) {
      return false;
    }
  }

  RegistroComercianteBloc({required this.registroCrearUsuarioComerciante})
      : super(RegistroComercianteinicialState()) {
    on<RegistroComercianteEvent>((event, emit) async {});
  }
}
